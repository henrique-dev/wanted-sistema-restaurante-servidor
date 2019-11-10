-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: restaurante_wanted
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arquivo`
--

DROP TABLE IF EXISTS `arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo` (
  `id_arquivo` int(11) NOT NULL AUTO_INCREMENT,
  `caminho` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_arquivo`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivo`
--

LOCK TABLES `arquivo` WRITE;
/*!40000 ALTER TABLE `arquivo` DISABLE KEYS */;
INSERT INTO `arquivo` VALUES (427,NULL),(428,NULL),(429,NULL),(430,NULL),(431,NULL),(432,NULL),(433,NULL),(434,NULL),(435,NULL),(436,NULL),(437,NULL),(438,NULL),(439,NULL),(440,NULL),(441,NULL),(442,NULL),(443,NULL),(444,NULL),(445,NULL),(446,NULL),(447,NULL),(448,NULL),(449,NULL),(450,NULL),(451,NULL),(452,NULL),(453,NULL),(454,NULL),(455,NULL),(456,NULL),(457,NULL);
/*!40000 ALTER TABLE `arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_cliente_usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_cliente_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (0,'','','','',0),(17,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',46),(18,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',48),(19,'argerio queiroz','02295260205','+5591983517619','argerioaf@gmail.com',51),(20,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',52),(21,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',53),(22,'argério','02295260205','+5591983517619','argerioaf@gmail.com',54),(23,'argério','02295260205','+5591983517619','argerioaf@gmail.com',56),(24,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',57),(25,'teste','02295260205','+5596981105390','argerioaf@gmail.com',58),(26,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',59),(27,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',60),(28,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',61),(29,'amon','02811511300','+5596981212109','Amon.ufc@gmail.com',62),(30,'Argério','02295260205','+5591983517619','argerioaf@gmail.com',63),(31,'Argerio','02295260205','+5591983517619','argerioaf@gmail.com',64),(32,'Renan Mescouto','02782267280','+5596981243468','renanmescouto123@gmail.com',65),(33,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',68),(34,'PAULO HENRIQUE','01741053200','+5596991100443','henrique.phgb@gmail.com',69),(35,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',70),(36,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',71),(37,'Argerio','02295260205','+5591983517619','argerioaf@gmail.com',67),(38,'Argerio Queiroz','02295260205','+5591983517619','argerioaf@gmail.com',72),(39,'Elza Moura Uchoa','56430663272','+5596991781167','uchoa.moura@hotmail.com',73),(40,'Argério','02295260205','+5591983517619','argerioaf@gmail.com',74),(41,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',75),(42,'Argério','02295260205','+5591983517619','argerioaf@gmail.com',76),(43,'Renan Mescouto','02782267280','+5596999099674','renanmescouto123@gmail.com',78),(44,'Argério','02295260205','+5591983517619','argerioaf@gmail.com',79),(45,'Tom Luz','49609777015','+5511970548934','tluz0422@gmail.com',80),(46,'Matheus Mendes','02297187289','+5596981286260','matheusmendescosta@icloud.com',81),(47,'Argério Queiroz da Silva Filho','02295260205','+5591983517619','argerioaf@gmail.com',82),(48,'Argério Queiroz da Silva Filho','02295260205','+5591983517619','argerioaf@gmail.com',83),(49,'Argério Queiroz da Silva Filho','02295260205','+5591983517619','argerioaf@gmail.com',84),(50,'Argerio','02295260205','+5596984109393','argerioaf@gmail.com',85),(51,'Argerio','02295260205','+5596984109393','argerioaf@gmail.com',86),(52,'Argerio Q SILVA FH','02295260205','+5596984109393','argerioaf@gmail.com',88),(53,'Argerio','02295260205','+5596984109393','argerioaf@gmail.com',89),(54,'Argerio Queiroz da Silva Filho','02295260205','+5596984109393','argerioaf@gmail.com',90),(55,'Argerio Queiroz','02295260205','+5596984109393','argerioaf@gmail.com',91),(56,'Júnior Santos','00805746293','+5596991190883','juniorsnts123@gmail.com',92),(57,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb.gmail.com',94),(58,'Renan Mescouto','02782267280','+5596999099674','renanmescouto123@gmail.com',93),(59,'Argerio Queiroz','02295260205','+5596984109393','argerioaf@gmail.com',95),(60,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',97),(61,'Argerio','02295260205','+5596984109393','argerioaf@gmail.com',96),(62,'Argerio','02295260205','+5596984109393','argerioaf@gmail.com',98),(63,'Argerio Queiroz','02295260205','+5596984109393','argerio@gmail.com',99),(64,'Argerio Queiroz da Silva FIlho','02295260205','+5596984109393','argerioaf@gmail.com',100),(65,'ARGERIO Queiroz Fh','02295260205','+5596984109393','argerioaf@gmail.com',101),(66,'Argerio Queiroz','02295260205','+5596984109393','argerioaf@gmail.com',103),(67,'Joao','00429678053','+5511986450011','gestaocadastrostone@gmail.com',105),(68,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',104),(69,'Leandro','00562480161','+5596981165519','leandro.u2@live.com',66),(70,'Usuário wanted','02295260205','+5596984109393','argerioaf@gmail.com',108),(71,'Renan Mescouto','02782267280','+5596999099674','renanmescouto123@gmail.com',109),(72,'Argerio Queiroz','02295260205','+5596984109393','argerioaf@gmail.com',110),(73,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',111),(74,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',114),(75,'Argerio Queiroz','02295260205','+5596984109393','argerioaf@gmail.com',113),(76,'Argerio','02295260205','+5596984109393','argerioaf@gmail.com',115),(77,'Argerio','02295260205','+5596984109393','argerioaf@gmail.com',116),(78,'Argerio Queiro','02295260205','+5596984109393','argerioaf@gmail.com',117),(79,'Argerio','02295260205','+5596984109393','argerioaf@gmail.com',118),(80,'Argerio Queiroz','02295260205','+5596984109393','argerioaf@gmail.com',119),(81,'Argerio','02295260205','+5596984109393','argerioaf@gmail.com',120),(82,'Argerio Queiroz da Silva Filho','02295260205','+5596984109393','argerioaf@gmail.com',121);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complemento`
--

DROP TABLE IF EXISTS `complemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complemento` (
  `id_complemento` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `id_arquivo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_complemento`),
  KEY `fk_complemento_arquivo1_idx` (`id_arquivo`),
  CONSTRAINT `fk_complemento_arquivo1` FOREIGN KEY (`id_arquivo`) REFERENCES `arquivo` (`id_arquivo`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complemento`
--

LOCK TABLES `complemento` WRITE;
/*!40000 ALTER TABLE `complemento` DISABLE KEYS */;
INSERT INTO `complemento` VALUES (402,'farinha',0.00,NULL),(403,'pÃ£o',0.00,NULL),(404,'beterraba',5.00,NULL),(405,'cacto',25.00,NULL);
/*!40000 ALTER TABLE `complemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupomdesconto`
--

DROP TABLE IF EXISTS `cupomdesconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupomdesconto` (
  `id_cupomdesconto` int(11) NOT NULL AUTO_INCREMENT,
  `id_cupomdesconto_tipo` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `validade` timestamp NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `percentual` tinyint(1) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_cupomdesconto`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `id_cupomdesconto_tipo` (`id_cupomdesconto_tipo`),
  CONSTRAINT `cupomdesconto_ibfk_1` FOREIGN KEY (`id_cupomdesconto_tipo`) REFERENCES `cupomdesconto_tipo` (`id_cupomdesconto_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupomdesconto`
--

LOCK TABLES `cupomdesconto` WRITE;
/*!40000 ALTER TABLE `cupomdesconto` DISABLE KEYS */;
INSERT INTO `cupomdesconto` VALUES (1,3,'gericozinho','desconto de brother',1,'2019-08-26 00:00:00',1,0,10.00),(2,3,'teste1','teste',1,'2019-08-27 00:00:00',1,0,10.00),(3,1,'NOVATO','desconto para usuÃ¡rios novos no aplicativo Wanted',2,'2019-08-30 00:00:00',1,0,10.00),(4,3,'novato2','desconto para usuÃ¡rios novos no aplicativo Wanted',1,'2019-08-28 00:00:00',1,0,10.00),(5,3,'menos30','desconto de 30% no seu pedido',1,'2019-08-28 00:00:00',1,1,30.00),(6,3,'menos50','desconto de 50%',3,'2019-08-28 00:00:00',1,1,50.00),(7,3,'menos40','desconto de 40%',1,'2019-08-28 00:00:00',1,1,40.00),(8,3,'bemvindo','desconto de 50% no pedido para primeiros usuÃ¡rios, seja bem vindo a wanted e aproveite sua promoÃ§Ã£o',3,'2019-08-28 00:00:00',1,1,50.00),(9,3,'Menos502','desconto de 50%',1,'2019-08-28 00:00:00',1,1,50.00),(10,3,'amon','Cupom de 70% de desconto',0,'2019-08-28 00:00:00',1,1,70.00),(11,3,'amon2','Desconto de 70%',1,'2019-08-28 00:00:00',1,1,70.00),(12,3,'paulete','desconto do Paulete de 50 conto',100,'2019-09-30 00:00:00',1,0,50.00),(13,3,'35m','35%',100,'2019-09-30 00:00:00',1,1,35.00),(14,1,'Setembro30','Desconto: R$ 30,00',50,'2019-09-25 00:00:00',1,0,30.00),(15,3,'Setembro40','Desconto: R$ 40,00',50,'2019-09-25 00:00:00',1,0,40.00),(16,3,'menos60','60%',400,'2019-09-24 00:00:00',1,1,60.00),(17,3,'15zao','15%',100,'2019-09-30 00:00:00',1,1,15.00),(18,3,'10primeiros','Desconto bÃ´nus para os 10 primeiros clientes do aplicativo wanted, vocÃª foi premiado com 50% de desconto em qualquer prato do cardÃ¡pio',10,'2019-09-30 00:00:00',1,1,50.00),(19,3,'reduxsaga','teste redux saga',3,'2019-09-30 00:00:00',1,1,50.00),(20,3,'saga2','sagaredux2 30%',3,'2019-09-30 00:00:00',1,1,30.00),(21,3,'saga3','saga3 R$50,00',0,'2019-09-30 00:00:00',1,0,50.00),(22,3,'saga4','saga4 R$50,00',7,'2019-09-30 00:00:00',1,0,50.00),(23,3,'dada14','60 real',7,'2019-09-30 00:00:00',1,0,60.00),(24,3,'menos10','desconto de 10%',7,'2019-09-30 00:00:00',1,1,10.00),(25,3,'menos13','desconto de R$13,00',5,'2019-10-08 00:00:00',1,0,13.00),(26,3,'menos7','R$7,00 de desconto',2,'2019-10-24 00:00:00',1,0,7.00),(27,3,'menos15','R$15,00  de desconto',2,'2019-10-30 00:00:00',1,0,15.00),(28,3,'menos40%','40% de desconto',10,'2019-10-30 00:00:00',1,1,40.00),(29,3,'Semfrete','R$3,00',30,'2019-10-31 00:00:00',1,0,3.00),(30,3,'wanted','desconto',3,'2019-10-30 00:00:00',1,0,50.00),(31,3,'wanted50','desconto',3,'2019-10-30 00:00:00',1,1,50.00),(32,3,'inauguracao','desconto de inauguraÃ§Ã£o do aplicativo Wanted Food master',10,'2019-11-30 00:00:00',1,1,50.00);
/*!40000 ALTER TABLE `cupomdesconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupomdesconto_cliente`
--

DROP TABLE IF EXISTS `cupomdesconto_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupomdesconto_cliente` (
  `id_cliente` int(11) NOT NULL,
  `id_cupomdesconto` int(11) NOT NULL,
  `proxima_compra` tinyint(1) NOT NULL,
  `usado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_cliente`,`id_cupomdesconto`),
  KEY `id_cupomdesconto` (`id_cupomdesconto`),
  CONSTRAINT `cupomdesconto_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `cupomdesconto_cliente_ibfk_2` FOREIGN KEY (`id_cupomdesconto`) REFERENCES `cupomdesconto` (`id_cupomdesconto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupomdesconto_cliente`
--

LOCK TABLES `cupomdesconto_cliente` WRITE;
/*!40000 ALTER TABLE `cupomdesconto_cliente` DISABLE KEYS */;
INSERT INTO `cupomdesconto_cliente` VALUES (31,2,0,0),(31,4,0,0),(31,5,1,0),(31,6,0,0),(38,6,0,1),(38,7,0,1),(38,8,0,1),(38,9,1,0),(39,6,1,0),(40,11,1,0),(42,12,0,1),(42,13,0,1),(42,15,0,1),(42,16,0,1),(42,17,0,1),(42,18,0,1),(44,19,0,0),(44,20,0,0),(44,22,0,0),(44,23,0,0),(44,24,0,1),(44,25,0,1),(44,26,0,1),(46,27,0,1),(49,26,0,1),(49,27,0,1),(53,28,0,1),(55,28,0,1),(63,28,1,0),(66,28,0,1),(66,29,0,1),(66,31,1,0),(69,31,0,1),(79,32,1,0),(80,32,0,1),(82,32,0,1);
/*!40000 ALTER TABLE `cupomdesconto_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupomdesconto_item`
--

DROP TABLE IF EXISTS `cupomdesconto_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupomdesconto_item` (
  `id_item` int(11) NOT NULL,
  `id_cupomdesconto` int(11) NOT NULL,
  PRIMARY KEY (`id_item`,`id_cupomdesconto`),
  KEY `id_cupomdesconto` (`id_cupomdesconto`),
  CONSTRAINT `cupomdesconto_item_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  CONSTRAINT `cupomdesconto_item_ibfk_2` FOREIGN KEY (`id_cupomdesconto`) REFERENCES `cupomdesconto` (`id_cupomdesconto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupomdesconto_item`
--

LOCK TABLES `cupomdesconto_item` WRITE;
/*!40000 ALTER TABLE `cupomdesconto_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupomdesconto_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupomdesconto_tipo`
--

DROP TABLE IF EXISTS `cupomdesconto_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupomdesconto_tipo` (
  `id_cupomdesconto_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `controle` varchar(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  PRIMARY KEY (`id_cupomdesconto_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupomdesconto_tipo`
--

LOCK TABLES `cupomdesconto_tipo` WRITE;
/*!40000 ALTER TABLE `cupomdesconto_tipo` DISABLE KEYS */;
INSERT INTO `cupomdesconto_tipo` VALUES (1,'PRIMEIRA_COMPRA','Primeira compra'),(2,'DESCONTO_FRETE','Desconto frete'),(3,'DESCONTO_FIXO','Desconto fixo'),(4,'DESCONTO_ITEM','Desconto item');
/*!40000 ALTER TABLE `cupomdesconto_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `logradouro` varchar(75) NOT NULL,
  `bairro` varchar(75) NOT NULL,
  `complemento` varchar(75) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `cep` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `favorito` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_endereco`),
  KEY `fk_endereco_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_endereco_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (0,0,'Av. dos Timbiras','Beirol','','85A','Macapá','68902170','Buscar no local',0),(20,22,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(21,23,'Rua Euclides Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(22,25,'R. Euclídes Rodrigues','Central','De esquina com Av José de Anchieta','388','Santana','68925192','Minha casa',0),(23,26,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(24,28,'R. Pedro Siqueira Um','Universidade','Faculdade metq','180','Macapá','68925192','Faculdade',0),(25,31,'Rod. Duca Serra - Cabralzinho','Laguinho','Faculdade','55','Macapá','445555555','Argerio Queiroz',0),(26,31,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(27,39,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(28,40,'Euclides Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(29,42,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(30,44,'Rua Euclides Rodrigues','Central','De esquina','388','Macapá','68903014','Minha casa',0),(31,49,'Rua Euclides Rodrigues','Central','De esquina','388','Santana','68925192','My house',0),(32,49,'D7','Vila Amazonas','','126','Santana','68925192','House of dada',0),(33,49,'Já o interesse','Bj de','','388','Santana','83736283','Teste',0),(34,49,'Djdjdk','Sjdj','','338','Macapá','68903014','Teste 2',0),(35,49,'Ghhh','Vbhh','','356','Macapá','68903014','Teste 4yhh',0),(36,55,'Rua Euclides Rodrigues','Central','','388','Santana','68925192','Minha casa',0),(37,63,'Rua Euclides Rodrigues','Central','','388','Santana','68925192','My house',0),(38,66,'Euclides Rodrigues','Central','','388','Santana','68925192','Minha casa',0),(39,80,'Euclides Rodrigues ','Central','','388','Santana','68925192','Casa',0);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos_favoritos`
--

DROP TABLE IF EXISTS `enderecos_favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos_favoritos` (
  `id_cliente` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`,`id_endereco`),
  KEY `fk_enderecos_favoritos_endereco1_idx` (`id_endereco`),
  KEY `fk_enderecos_favoritos_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_enderecos_favoritos_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_enderecos_favoritos_endereco1` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos_favoritos`
--

LOCK TABLES `enderecos_favoritos` WRITE;
/*!40000 ALTER TABLE `enderecos_favoritos` DISABLE KEYS */;
INSERT INTO `enderecos_favoritos` VALUES (17,0),(18,0),(19,0),(20,0),(21,0),(24,0),(27,0),(29,0),(30,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(40,0),(41,0),(43,0),(45,0),(46,0),(47,0),(48,0),(50,0),(51,0),(52,0),(53,0),(54,0),(56,0),(57,0),(58,0),(59,0),(60,0),(61,0),(62,0),(64,0),(65,0),(67,0),(68,0),(69,0),(70,0),(71,0),(72,0),(73,0),(74,0),(75,0),(76,0),(77,0),(78,0),(79,0),(81,0),(82,0),(22,20),(23,21),(25,22),(26,23),(28,24),(31,25),(39,27),(42,29),(44,30),(49,31),(55,36),(63,37),(66,38),(80,39);
/*!40000 ALTER TABLE `enderecos_favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `id_entrega` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `efetuada` tinyint(1) NOT NULL,
  `eventualidade` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_entrega`,`id_pedido`),
  KEY `fk_entrega_pedido1_idx` (`id_pedido`),
  CONSTRAINT `fk_entrega_pedido1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapagamento`
--

DROP TABLE IF EXISTS `formapagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapagamento` (
  `id_formapagamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `controle` varchar(50) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `hash_id` varchar(256) DEFAULT NULL,
  `bandeira` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_formapagamento`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `formapagamento_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
INSERT INTO `formapagamento` VALUES (0,0,'DINHEIRO','A dinheiro',NULL,NULL),(2,0,'PAGSEGURO','Cartao Credito - PagSeguro',NULL,NULL),(6,42,'PAGARME','Cartao de credito - Pagarme','card_ck0h6sn9x01xtw06fog76r1vm',NULL),(7,42,'PAGARME','Cartao de credito - Pagarme','card_ck10slj5001qbsr6eli790s2x',NULL),(8,42,'PAGARME','Cartao de credito - Pagarme','card_ck10slj5001qbsr6eli790s2x',NULL),(9,42,'PAGARME','Cartao de credito - Pagarme','card_ck10slj5001qbsr6eli790s2x',NULL),(10,42,'PAGARME','Cartao de credito - Pagarme','card_ck10slj5001qbsr6eli790s2x',NULL),(11,42,'PAGARME','Cartao de credito - Pagarme','card_ck0h6sn9x01xtw06fog76r1vm',NULL),(12,44,'PAGARME','Cartao de credito - Pagarme','card_ck14136s503nuxj6ds0jo42zf',NULL),(13,44,'PAGARME','Cartao de credito - Pagarme','card_ck18g8si5057oa76e851r1abo',NULL),(14,49,'PAGARME','Cartao de credito - Pagarme','card_ck19hhaz800xppo6dnphw4hv3',NULL),(15,49,'PAGARME','Cartão de crédito - Pagarme','card_ck0h6sn9x01xtw06fog76r1vm',NULL),(16,41,'PAGARME','Cartão de crédito - Pagarme','card_ck10slj5001qbsr6eli790s2x',NULL),(17,41,'PAGARME','Cartão de crédito - Pagarme','card_ck14136s503nuxj6ds0jo42zf',NULL),(18,41,'PAGARME','Cartão de crédito - Pagarme','card_ck0h6sn9x01xtw06fog76r1vm',NULL),(19,50,'PAGARME','**** **** **** 6158',NULL,'MASTERCARD'),(20,51,'PAGARME','**** **** **** 6158','card_ck1gk8sim0a4ypj6d6uqfdiy5','MASTERCARD'),(21,52,'PAGARME','**** **** **** 6158','card_ck1gj30jj09tppo6dkrpa2kbb','MASTERCARD'),(22,53,'PAGARME','**** **** **** 6158','card_ck1gk8sim0a4ypj6d6uqfdiy5','MASTERCARD'),(23,55,'PAGARME','**** **** **** 6158','card_ck1gk8sim0a4ypj6d6uqfdiy5','MASTERCARD'),(24,57,'PAGARME','**** **** **** 5842','card_ck1gtdt1a00h2c06epekl2oh2','MASTERCARD'),(25,61,'PAGARME','**** **** **** 6158','card_ck1gk8sim0a4ypj6d6uqfdiy5','MASTERCARD'),(26,63,'PAGARME','**** **** **** 6158','card_ck1gk8sim0a4ypj6d6uqfdiy5','MASTERCARD'),(27,66,'PAGARME','**** **** **** 9984','card_ck1qv8x3300nci76ei63kayzj','VISA'),(28,68,'PAGARME','**** **** **** 0067','card_ck1v3q60702ixh46el43f6ny3','MASTERCARD'),(29,68,'PAGARME','**** **** **** 7925','card_ck1z0cvlr041j856e04ud1fnf','MASTERCARD'),(30,68,'PAGARME','**** **** **** 6930','card_ck1z1kszl0j1geb5xt85j0eqy','MASTERCARD'),(31,68,'PAGARME','**** **** **** 1526','card_ck1z3up1w0l5cra62rvmm4qvv','VISA'),(32,66,'PAGARME','**** **** **** 6182','card_ck1z4cbcn0k6umh5zgrgfx1ki','VISA'),(33,66,'PAGARME','**** **** **** 6158','card_ck1ze4x600pysu964dryowgwz','MASTERCARD'),(34,79,'PAGARME','**** **** **** 6158','card_ck1ze4x600pysu964dryowgwz','MASTERCARD'),(35,80,'PAGARME','**** **** **** 6158','card_ck2q40yr20j684f5xuspvbd4b','MASTERCARD');
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapagamentos_favoritas`
--

DROP TABLE IF EXISTS `formapagamentos_favoritas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapagamentos_favoritas` (
  `id_cliente` int(11) NOT NULL,
  `id_formapagamento` int(11) NOT NULL,
  KEY `id_cliente` (`id_cliente`),
  KEY `id_formapagamento` (`id_formapagamento`),
  CONSTRAINT `formapagamentos_favoritas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `formapagamentos_favoritas_ibfk_2` FOREIGN KEY (`id_formapagamento`) REFERENCES `formapagamento` (`id_formapagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamentos_favoritas`
--

LOCK TABLES `formapagamentos_favoritas` WRITE;
/*!40000 ALTER TABLE `formapagamentos_favoritas` DISABLE KEYS */;
INSERT INTO `formapagamentos_favoritas` VALUES (17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(37,0),(33,0),(34,0),(35,0),(36,0),(38,0),(39,0),(40,0),(41,0),(42,10),(43,0),(44,13),(45,6),(46,0),(47,0),(48,0),(49,15),(50,19),(51,20),(52,0),(53,22),(54,0),(55,23),(56,0),(57,24),(58,0),(59,0),(60,0),(61,25),(62,0),(63,26),(64,0),(65,0),(66,33),(67,0),(68,31),(69,0),(70,0),(71,0),(72,0),(73,0),(74,0),(75,0),(76,0),(77,0),(78,0),(79,34),(80,0),(81,0),(82,0);
/*!40000 ALTER TABLE `formapagamentos_favoritas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Bebidas'),(2,'Verdes'),(3,'Carnes'),(4,'Molhados'),(5,'Secos'),(6,'Doces'),(7,'Salgados'),(400,'Teste'),(401,'Teste2'),(402,'Combos'),(403,'Entradas'),(404,'Hamburgueres'),(405,'Massas'),(406,'Pratos Executivos'),(407,'Vegetarianos'),(408,'da'),(409,'batatinhas');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_variacao`
--

DROP TABLE IF EXISTS `grupo_variacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_variacao` (
  `id_grupo_variacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `grupo` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  PRIMARY KEY (`id_grupo_variacao`),
  KEY `fk_grupo_variacao_item1_idx` (`id_item`),
  CONSTRAINT `fk_grupo_variacao_item1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_variacao`
--

LOCK TABLES `grupo_variacao` WRITE;
/*!40000 ALTER TABLE `grupo_variacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_variacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'Alface'),(2,'Tomate'),(3,'Cebola'),(4,'Pepino'),(5,'Cenoura'),(200,'Batata palha'),(201,'Cheiro verde'),(202,'Mastruz'),(203,'Leite'),(204,'Amendoim'),(205,'Alcaçus');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `modificavel` tinyint(1) NOT NULL,
  `modificavel_ingrediente` tinyint(1) NOT NULL,
  `tempo_preparo` varchar(50) NOT NULL DEFAULT '1 minuto',
  PRIMARY KEY (`id_item`),
  KEY `fk_prato_generoprato1_idx` (`id_genero`),
  CONSTRAINT `fk_prato_generoprato1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (416,'Frank James','...',22.00,402,0,0,'muito tempo'),(417,'Belle Starr','...',25.00,402,0,0,'...'),(418,'Jim Killer','...',36.00,402,0,0,'1 minuto'),(419,'Fora da Lei','...',45.00,402,0,0,'1 minuto'),(420,'Fritas Bonnie & Clyde','...',5.00,403,0,0,'1 minuto'),(421,'Fritas Dupla','...',5.00,403,0,0,'1 minuto'),(422,'Fritas Wanted','...',5.00,403,0,0,'1 minuto'),(423,'Onion Ring','...',5.00,403,0,0,'1 minuto'),(424,'Wanted Ribs','...',5.00,403,0,0,'1 minuto'),(425,'Belle Starr','...',7.00,404,0,0,'1 minuto'),(426,'Billy the Kid','...',7.00,404,0,0,'1 minuto'),(427,'Clay Alisson','...',7.00,404,0,0,'1 minuto'),(428,'Dick Turpin','...',7.00,404,0,0,'1 minuto'),(429,'Frank James','...',7.00,404,0,0,'1 minuto'),(430,'Henri Starr','...',7.00,404,0,0,'1 minuto'),(431,'Jesse James','...',5.00,404,0,0,'1 minuto'),(432,'Jim Killer','...',7.00,404,0,0,'1 minuto'),(433,'John Wesley Hardin','...',7.00,404,0,0,'1 minuto'),(434,'Sam Bass','...',7.00,404,0,0,'1 minuto'),(435,'Wyatt Earp','...',8.00,404,0,0,'1 minuto'),(436,'Xerrif Willian J. Brady','...',10.00,404,0,0,'1 minuto'),(437,'Ben Thompson','...',15.00,405,0,0,'1 minuto'),(438,'Billy Mathews','...',12.00,405,0,0,'1 minuto'),(439,'Calamity Jane (Alcatra)','...',24.00,406,0,0,'1 minuto'),(440,'Pat Garret (Picanha)','...',35.00,406,0,0,'1 minuto'),(441,'Annie Oakley','...',14.50,407,0,0,'Alguns minutos'),(442,'Bucth Cassidy','...',7.00,407,0,0,'1 minuto'),(443,'John Dillinger','...',16.00,407,0,0,'1 minuto'),(444,'Tom Horn','...',15.50,407,0,0,'1 minuto'),(445,'Teste','Item de teste',100.00,400,1,0,'um seculo');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_arquivo`
--

DROP TABLE IF EXISTS `item_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_arquivo` (
  `id_item` int(11) NOT NULL,
  `id_arquivo` int(11) NOT NULL,
  PRIMARY KEY (`id_item`,`id_arquivo`),
  KEY `fk_arquivo_has_prato_prato1_idx` (`id_item`),
  KEY `fk_arquivo_has_prato_arquivo1_idx` (`id_arquivo`),
  CONSTRAINT `fk_arquivo_has_prato_arquivo1` FOREIGN KEY (`id_arquivo`) REFERENCES `arquivo` (`id_arquivo`),
  CONSTRAINT `fk_arquivo_has_prato_prato1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_arquivo`
--

LOCK TABLES `item_arquivo` WRITE;
/*!40000 ALTER TABLE `item_arquivo` DISABLE KEYS */;
INSERT INTO `item_arquivo` VALUES (416,455),(417,427),(418,428),(419,429),(420,430),(421,431),(422,432),(423,433),(424,434),(425,435),(426,436),(427,437),(428,438),(429,439),(430,440),(431,441),(432,442),(433,443),(434,444),(435,445),(436,446),(437,447),(438,448),(439,449),(440,450),(441,451),(442,452),(443,453),(444,454),(445,457);
/*!40000 ALTER TABLE `item_arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_complemento`
--

DROP TABLE IF EXISTS `item_complemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_complemento` (
  `id_item` int(11) NOT NULL,
  `id_complemento` int(11) NOT NULL,
  PRIMARY KEY (`id_item`,`id_complemento`),
  KEY `fk_prato_has_complemento_complemento1_idx` (`id_complemento`),
  KEY `fk_prato_has_complemento_prato1_idx` (`id_item`),
  CONSTRAINT `fk_prato_has_complemento_complemento1` FOREIGN KEY (`id_complemento`) REFERENCES `complemento` (`id_complemento`),
  CONSTRAINT `fk_prato_has_complemento_prato1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_complemento`
--

LOCK TABLES `item_complemento` WRITE;
/*!40000 ALTER TABLE `item_complemento` DISABLE KEYS */;
INSERT INTO `item_complemento` VALUES (445,404),(445,405);
/*!40000 ALTER TABLE `item_complemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_ingrediente`
--

DROP TABLE IF EXISTS `item_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_ingrediente` (
  `id_item` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  PRIMARY KEY (`id_item`,`id_ingrediente`),
  KEY `fk_ingrediente_has_item_item1_idx` (`id_item`),
  KEY `fk_ingrediente_has_item_ingrediente1_idx` (`id_ingrediente`),
  CONSTRAINT `fk_ingrediente_has_item_ingrediente1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`),
  CONSTRAINT `fk_ingrediente_has_item_item1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_ingrediente`
--

LOCK TABLES `item_ingrediente` WRITE;
/*!40000 ALTER TABLE `item_ingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_tipo`
--

DROP TABLE IF EXISTS `item_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_tipo` (
  `id_item` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_item`,`id_tipo`),
  KEY `fk_prato_has_tipo_tipo1_idx` (`id_tipo`),
  KEY `fk_prato_has_tipo_prato1_idx` (`id_item`),
  CONSTRAINT `fk_prato_has_tipo_prato1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  CONSTRAINT `fk_prato_has_tipo_tipo1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_tipo`
--

LOCK TABLES `item_tipo` WRITE;
/*!40000 ALTER TABLE `item_tipo` DISABLE KEYS */;
INSERT INTO `item_tipo` VALUES (445,2),(445,3),(441,5),(445,5);
/*!40000 ALTER TABLE `item_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_favoritos`
--

DROP TABLE IF EXISTS `itens_favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_favoritos` (
  `id_cliente` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`,`id_item`),
  KEY `id_item` (`id_item`),
  CONSTRAINT `itens_favoritos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `itens_favoritos_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_favoritos`
--

LOCK TABLES `itens_favoritos` WRITE;
/*!40000 ALTER TABLE `itens_favoritos` DISABLE KEYS */;
INSERT INTO `itens_favoritos` VALUES (31,416),(53,418),(64,419),(79,419),(31,420),(39,420),(42,420),(44,420),(63,420),(66,420),(80,420),(81,420),(42,421),(39,422),(31,423),(49,423),(80,423),(55,425),(80,426),(44,428),(70,429),(64,431),(46,432),(65,432),(66,434),(63,435),(82,435),(55,436),(62,436),(82,436),(46,438),(65,438),(44,440),(63,440),(61,441),(49,442),(61,442),(62,442),(70,444);
/*!40000 ALTER TABLE `itens_favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacao`
--

DROP TABLE IF EXISTS `notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacao` (
  `id_notificacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `mensagem` json NOT NULL,
  `entregue` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notificacao`),
  KEY `fk_notificacao_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_notificacao_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
INSERT INTO `notificacao` VALUES (1,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 403, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(2,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 403, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(3,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 403, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(4,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 403, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(5,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 403, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(6,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 403, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(7,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 404, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(8,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 404, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(9,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 404, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(10,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 404, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(11,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 404, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(12,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 405, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(13,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 405, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(14,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 405, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(15,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 405, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(16,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 405, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(17,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 405, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(18,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 406, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(19,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 406, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(20,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 406, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(21,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 406, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(22,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 406, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(23,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 406, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(24,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 407, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(25,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 407, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(26,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 407, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(27,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 407, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(28,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 407, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(29,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 407, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(30,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 408, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(31,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 408, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(32,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 408, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(33,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 408, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(34,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 408, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(35,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 408, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(36,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 409, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(37,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 409, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(38,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 409, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(39,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 409, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(40,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 409, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(41,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 410, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(42,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 410, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(43,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 410, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(44,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 410, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(45,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 410, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(46,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 410, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(47,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 411, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(48,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 411, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(49,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 411, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(50,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 411, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(51,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 411, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(52,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 411, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(53,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 412, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(54,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 412, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(55,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 412, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(56,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 412, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(57,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 412, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(58,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 412, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(59,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 413, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(60,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 413, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(61,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 413, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(62,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 413, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(63,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 413, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(64,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 413, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(65,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 414, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(66,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 414, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(67,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 414, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(68,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 414, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(69,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 414, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(70,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 414, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(71,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 415, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(72,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 415, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(73,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 415, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(74,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 415, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(75,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 415, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(76,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 415, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(77,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 416, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(78,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 416, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(79,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 416, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(80,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 416, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(81,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 416, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(82,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 416, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(83,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 417, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(84,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 417, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(85,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 417, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(86,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 417, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(87,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 417, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(88,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 417, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(89,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 418, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(90,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 418, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(91,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 418, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(92,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 418, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(93,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 418, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(94,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 418, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(95,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 419, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(96,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 419, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(97,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 419, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(98,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 419, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(99,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 419, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(100,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 419, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(101,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 419, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(102,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 420, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(103,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 420, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(104,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 420, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(105,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 420, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(106,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 420, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(107,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 421, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(108,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 421, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(109,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 421, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(110,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 421, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(111,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 421, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(112,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 422, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(113,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 423, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(114,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 423, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(115,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 423, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(116,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 423, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(117,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 423, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(118,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 423, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(119,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 424, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(120,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 424, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(121,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 424, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(122,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 424, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(123,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 424, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(124,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 424, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(125,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 425, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(126,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 425, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(127,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 425, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(128,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 425, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(129,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 425, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(130,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 425, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(131,46,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 426, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(132,46,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 426, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',0),(133,46,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 426, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',0),(134,46,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 426, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',0),(135,46,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 426, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',0),(136,46,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 426, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',0),(137,46,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 426, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(138,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 427, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(139,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 427, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(140,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 427, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(141,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 427, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(142,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 427, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(143,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 427, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(144,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 428, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(145,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 428, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(146,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 428, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(147,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 428, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(148,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 428, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(149,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 428, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(150,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 429, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(151,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 430, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(152,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 429, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(153,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 429, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(154,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 430, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(155,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 429, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(156,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 430, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(157,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 430, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(158,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 429, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(159,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 430, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(160,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 430, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(161,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 429, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(162,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 431, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(163,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 431, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(164,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 432, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(165,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 433, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(166,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 432, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(167,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 433, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(168,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 434, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(169,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 434, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(170,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 435, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(171,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 435, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(172,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 436, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(173,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 436, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(174,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 437, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(175,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 437, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(176,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 438, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(177,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 438, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(178,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 439, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(179,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 439, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(180,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 440, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(181,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 440, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(182,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 441, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(183,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 441, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(184,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 442, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(185,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 442, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(186,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 443, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(187,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 443, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(188,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 444, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(189,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 444, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(190,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 444, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(191,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 444, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(192,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 444, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(193,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 444, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(194,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 445, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(195,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 445, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(196,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 445, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(197,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 445, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(198,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 445, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(199,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 445, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(200,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 446, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(201,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 446, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',0),(202,48,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 447, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(203,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 446, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',0),(204,48,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 448, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(205,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 446, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',0),(206,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 446, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',0),(207,44,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 446, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',0),(208,48,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 448, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(209,48,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 448, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(210,48,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 448, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(211,48,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 448, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(212,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 449, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(213,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 449, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(214,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 449, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(215,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 449, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(216,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 449, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(217,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 450, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(218,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 450, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(219,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 450, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(220,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 450, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(221,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 450, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(222,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 450, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(223,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 450, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(224,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 451, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(225,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 451, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(226,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 452, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(227,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 452, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(228,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 452, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(229,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 452, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(230,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 452, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(231,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 452, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(232,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 453, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(233,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 453, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(234,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 453, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(235,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 453, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(236,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 453, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(237,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 454, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(238,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 454, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(239,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 454, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(240,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 454, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(241,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 454, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(242,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 454, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(243,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 455, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(244,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 455, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(245,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 456, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(246,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 456, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(247,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 457, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(248,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 457, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(249,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 458, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(250,49,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 458, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(251,51,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 459, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(252,51,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 459, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(253,51,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 459, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(254,51,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 459, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(255,51,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 459, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(256,51,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 459, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(257,53,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 460, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(258,53,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 461, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(259,53,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 461, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(260,53,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 461, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(261,53,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 461, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(262,53,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 461, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(263,53,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 461, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(264,55,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 462, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(265,55,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 462, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(266,55,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 462, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(267,55,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 462, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(268,55,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 462, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(269,55,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 462, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(270,57,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 463, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(271,57,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 463, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(272,57,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 463, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(273,57,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 463, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(274,57,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 463, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(275,57,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 464, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(276,57,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 464, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',0),(277,60,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 465, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(278,60,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 465, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(279,60,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 465, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(280,60,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 465, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(281,60,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 465, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(282,60,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 466, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',0),(283,61,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 467, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(284,61,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 468, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(285,61,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 468, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(286,61,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 469, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(287,61,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 469, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(288,62,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 470, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(289,62,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 470, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(290,62,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 470, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',0),(291,62,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 470, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',0),(292,62,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 470, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',0),(293,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 471, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(294,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 471, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(295,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 471, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(296,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 471, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(297,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 471, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(298,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 471, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(299,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 472, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(300,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 472, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(301,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 473, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(302,63,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 473, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',0),(303,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 475, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(304,65,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 474, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',0),(305,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 475, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(306,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 475, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(307,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 475, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(308,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 475, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(309,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 475, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(310,65,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 474, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',0),(311,65,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 474, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',0),(312,65,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 474, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',0),(313,65,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 474, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',0),(314,65,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 474, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',0),(315,65,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 474, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',0),(316,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 476, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(317,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 476, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(318,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 477, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(319,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 477, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(320,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 478, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(321,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 478, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(322,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 480, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(323,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 482, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(324,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 482, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(325,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 482, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(326,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 482, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(327,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 482, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(328,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 490, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(329,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 490, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(330,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 490, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento não efetuado\"}',1),(331,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 492, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(332,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 492, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(333,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 493, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(334,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 493, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(335,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 495, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento não efetuado\"}',1),(336,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 496, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(337,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 496, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(338,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 497, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pagamento recusado pela operadora do cartão\"}',1),(339,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 498, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pagamento recusado pela operadora do cartão\"}',1),(340,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 499, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(341,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 499, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(342,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 499, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(343,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 499, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(344,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 499, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(345,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 499, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(346,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 500, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(347,68,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 500, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',0),(348,69,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 501, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(349,69,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 501, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(350,69,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 501, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(351,69,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 501, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(352,69,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 501, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(353,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 502, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pagamento recusado pela operadora do cartão\"}',1),(354,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 503, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(355,66,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 503, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(356,79,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 504, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(357,79,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 504, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(358,79,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 504, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(359,79,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 504, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(360,79,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 504, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(361,79,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 505, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(362,79,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 505, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(363,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 506, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(364,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 507, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pagamento recusado pela operadora do cartão\"}',1),(365,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 508, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Pagamento recusado pela operadora do cartão\"}',1),(366,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 509, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(367,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 509, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(368,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 509, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(369,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 509, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(370,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 509, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(371,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 510, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(372,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 510, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(373,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 510, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(374,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 510, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(375,80,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 510, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(376,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 511, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(377,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 511, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(378,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 511, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(379,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 511, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(380,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 511, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(381,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 512, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(382,82,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 513, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(383,82,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 513, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(384,82,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 513, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',0),(385,82,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 513, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',0),(386,82,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 513, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',0),(387,82,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 513, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(388,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 512, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(389,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 512, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(390,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 512, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(391,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 512, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(392,74,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 514, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1);
/*!40000 ALTER TABLE `notificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `data` timestamp NOT NULL,
  `itens` json NOT NULL,
  `precototal` decimal(8,2) NOT NULL,
  `id_formapagamento` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  `pagamentoefetuado` tinyint(1) NOT NULL DEFAULT '0',
  `estado` int(11) NOT NULL,
  `observacao_entrega` varchar(150) DEFAULT NULL,
  `frete` decimal(8,2) DEFAULT NULL,
  `id_cupomdesconto` int(11) DEFAULT NULL,
  `token` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_formapagamento1_idx` (`id_formapagamento`),
  KEY `fk_pedido_cliente1_idx` (`id_cliente`),
  KEY `fk_pedido_endereco1_idx` (`id_endereco`),
  KEY `id_cupomdesconto` (`id_cupomdesconto`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_pedido_endereco1` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_pedido_formapagamento1` FOREIGN KEY (`id_formapagamento`) REFERENCES `formapagamento` (`id_formapagamento`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cupomdesconto`) REFERENCES `cupomdesconto` (`id_cupomdesconto`)
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (357,'2019-08-23 17:53:08','[{\"id\": 407, \"nome\": \"Belle Starr\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,31,0,1,11,'',3.00,NULL,NULL),(358,'2019-08-24 19:59:58','[{\"id\": 416, \"nome\": \"Frank James\", \"preco\": 22.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',25.00,0,31,0,1,11,'Com molho',3.00,NULL,NULL),(359,'2019-08-24 20:49:49','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',53.00,0,31,0,1,11,'Sem cuspe e sem suor',3.00,NULL,NULL),(360,'2019-08-26 13:47:21','[{\"id\": 440, \"nome\": \"Pat Garret (Picanha)\", \"preco\": 35.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',20.50,0,38,0,1,11,'',3.00,6,NULL),(361,'2019-08-26 13:58:51','[{\"id\": 440, \"nome\": \"Pat Garret (Picanha)\", \"preco\": 35.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',24.00,0,38,0,1,11,'',3.00,7,NULL),(362,'2019-08-26 14:14:16','[{\"id\": 440, \"nome\": \"Pat Garret (Picanha)\", \"preco\": 35.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',20.50,0,38,0,1,11,'',3.00,8,NULL),(363,'2019-08-26 15:39:51','[{\"id\": 434, \"nome\": \"Sam Bass\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 422, \"nome\": \"Fritas Wanted\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',9.00,0,39,0,1,11,'Sem salada',3.00,6,NULL),(364,'2019-09-02 03:42:59','[{\"id\": 431, \"nome\": \"Jesse James\", \"preco\": 0.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 422, \"nome\": \"Fritas Wanted\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,41,0,1,11,'',3.00,NULL,NULL),(365,'2019-09-03 03:36:08','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',3.00,0,42,0,1,11,'',3.00,12,NULL),(366,'2019-09-03 03:38:15','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 418, \"nome\": \"Jim Killer\", \"preco\": 36.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 443, \"nome\": \"John Dillinger\", \"preco\": 16.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 429, \"nome\": \"Frank James\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 428, \"nome\": \"Dick Turpin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',109.00,0,42,0,1,11,'',3.00,NULL,NULL),(367,'2019-09-03 03:40:11','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 418, \"nome\": \"Jim Killer\", \"preco\": 36.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 443, \"nome\": \"John Dillinger\", \"preco\": 16.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 429, \"nome\": \"Frank James\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 428, \"nome\": \"Dick Turpin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',109.00,0,42,0,1,11,'',3.00,NULL,NULL),(368,'2019-09-03 15:11:05','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,42,0,1,11,'',3.00,NULL,NULL),(369,'2019-09-03 16:22:24','[{\"id\": 441, \"nome\": \"Annie Oakley\", \"preco\": 14.5, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',17.50,0,41,0,1,11,'',3.00,NULL,NULL),(370,'2019-09-03 18:26:38','[{\"id\": 426, \"nome\": \"Billy the Kid\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',7.55,0,42,0,1,11,'',3.00,13,NULL),(371,'2019-09-03 20:52:05','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',3.00,0,42,0,1,11,'',3.00,15,NULL),(372,'2019-09-03 21:06:04','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,42,0,1,11,'',3.00,NULL,NULL),(373,'2019-09-06 16:38:08','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,42,0,1,11,'',3.00,NULL,NULL),(374,'2019-09-06 22:53:38','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,42,0,1,11,'',3.00,NULL,NULL),(375,'2019-09-06 22:58:06','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,42,0,1,11,'',3.00,NULL,NULL),(376,'2019-09-06 23:04:07','[{\"id\": 419, \"nome\": \"Fora da Lei\", \"preco\": 45.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}, {\"id\": 422, \"nome\": \"Fritas Wanted\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',43.00,0,42,0,1,11,'',3.00,16,NULL),(377,'2019-09-06 23:21:50','[{\"id\": 416, \"nome\": \"Frank James\", \"preco\": 22.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 432, \"nome\": \"Jim Killer\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',14.60,0,42,0,1,11,'',3.00,16,NULL),(378,'2019-09-08 00:55:53','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 427, \"nome\": \"Clay Alisson\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',35.00,0,41,0,1,11,'',3.00,NULL,NULL),(379,'2019-09-11 19:31:33','[{\"id\": 419, \"nome\": \"Fora da Lei\", \"preco\": 45.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}, {\"id\": 426, \"nome\": \"Billy the Kid\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',85.45,0,42,0,1,11,'',3.00,17,NULL),(380,'2019-09-11 19:34:17','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,42,0,1,11,'',3.00,NULL,NULL),(381,'2019-09-19 03:47:06','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 427, \"nome\": \"Clay Alisson\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',15.00,0,42,0,1,11,'',3.00,18,NULL),(382,'2019-09-20 11:48:05','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',33.00,0,42,0,1,11,'',3.00,NULL,NULL),(383,'2019-09-25 15:32:06','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',33.00,0,42,0,1,11,'',3.00,NULL,NULL),(384,'2019-09-26 03:13:58','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 426, \"nome\": \"Billy the Kid\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',15.00,0,42,29,1,11,'',3.00,NULL,NULL),(385,'2019-09-26 04:30:53','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',18.50,0,42,29,1,11,'Teste',3.00,NULL,NULL),(386,'2019-09-26 04:41:14','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 4, \"complementos\": [], \"ingredientes\": []}]',23.00,0,42,29,1,11,'',3.00,NULL,NULL),(387,'2019-09-26 05:09:06','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,42,29,1,11,'',3.00,NULL,NULL),(388,'2019-09-26 11:17:18','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(389,'2019-09-26 11:28:09','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(390,'2019-09-26 11:35:20','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(391,'2019-09-26 11:45:25','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(392,'2019-09-26 12:00:25','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(393,'2019-09-26 12:11:23','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(394,'2019-09-26 12:24:45','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(395,'2019-09-26 12:27:09','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(396,'2019-09-26 12:30:48','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(397,'2019-09-26 12:34:05','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(398,'2019-09-26 12:36:56','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(399,'2019-09-26 13:02:57','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,NULL),(400,'2019-09-26 13:09:00','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,'7019569'),(401,'2019-09-26 13:12:55','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,'7019577'),(402,'2019-09-26 13:17:34','[{\"id\": 444, \"nome\": \"Tom Horn\", \"preco\": 15.5, \"variacoes\": null, \"precoTotal\": null, \"quantidade\": 0, \"complementos\": [], \"ingredientes\": null}]',18.50,0,42,0,1,11,NULL,3.00,NULL,'7019586'),(403,'2019-09-26 14:00:51','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,6,42,29,1,11,'',3.00,NULL,'7019957'),(404,'2019-09-26 22:30:17','[{\"id\": 428, \"nome\": \"Dick Turpin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,0,44,0,1,11,'',3.00,NULL,NULL),(405,'2019-09-28 20:50:15','[{\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',13.00,12,44,30,1,11,'',3.00,NULL,'7035196'),(406,'2019-09-28 23:22:13','[{\"id\": 428, \"nome\": \"Dick Turpin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',17.00,12,44,30,1,11,'',3.00,NULL,'7035560'),(407,'2019-09-28 23:51:08','[{\"id\": 428, \"nome\": \"Dick Turpin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,12,44,30,1,11,'',3.00,NULL,'7035631'),(408,'2019-09-28 23:53:25','[{\"id\": 440, \"nome\": \"Pat Garret (Picanha)\", \"preco\": 35.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',38.00,12,44,30,1,11,'',3.00,NULL,'7035638'),(409,'2019-09-29 23:50:26','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',7.50,0,44,30,1,11,'',3.00,24,NULL),(410,'2019-09-30 17:59:59','[{\"id\": 440, \"nome\": \"Pat Garret (Picanha)\", \"preco\": 35.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 440, \"nome\": \"Pat Garret (Picanha)\", \"preco\": 35.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',60.00,12,44,30,1,11,'',3.00,25,'7046124'),(411,'2019-09-30 18:09:22','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 432, \"nome\": \"Jim Killer\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',15.00,12,44,30,1,11,'',3.00,NULL,'7046164'),(412,'2019-09-30 18:13:51','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,12,44,30,1,11,'',3.00,NULL,'7046202'),(413,'2019-09-30 20:59:18','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,12,44,30,1,11,'',3.00,NULL,'7047749'),(414,'2019-10-01 18:56:36','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 432, \"nome\": \"Jim Killer\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',20.00,12,44,30,1,11,'',3.00,NULL,'7053080'),(415,'2019-10-01 19:22:04','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,12,44,30,1,11,'',3.00,NULL,'7053215'),(416,'2019-10-01 19:32:47','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,12,44,30,1,11,'',3.00,NULL,'7053681'),(417,'2019-10-01 19:48:17','[{\"id\": 442, \"nome\": \"Bucth Cassidy\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,12,44,30,1,11,'',3.00,NULL,'7053806'),(418,'2019-10-01 20:02:20','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,12,44,30,1,11,'',3.00,NULL,'7054025'),(419,'2019-10-01 20:15:09','[{\"id\": 426, \"nome\": \"Billy the Kid\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',10.00,12,44,30,1,11,'',3.00,26,'7054339'),(420,'2019-10-01 20:24:13','[{\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,44,30,1,11,'',3.00,NULL,NULL),(421,'2019-10-01 20:29:33','[{\"id\": 419, \"nome\": \"Fora da Lei\", \"preco\": 45.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',48.00,0,44,30,1,11,'',3.00,NULL,NULL),(422,'2019-10-01 20:33:38','[{\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,44,30,1,11,'',3.00,NULL,NULL),(423,'2019-10-01 20:34:36','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,12,44,30,1,11,'',3.00,NULL,'7054502'),(424,'2019-10-01 22:57:34','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 416, \"nome\": \"Frank James\", \"preco\": 22.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',30.00,0,44,30,1,11,'',3.00,NULL,NULL),(425,'2019-10-01 23:05:10','[{\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,13,44,30,1,11,'',3.00,NULL,'7056066'),(426,'2019-10-01 23:14:11','[{\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',3.00,0,46,0,1,11,'',3.00,27,NULL),(427,'2019-10-02 06:10:18','[{\"id\": 419, \"nome\": \"Fora da Lei\", \"preco\": 45.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',48.00,13,44,30,1,11,'',3.00,NULL,'7056729'),(428,'2019-10-02 12:18:27','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,13,44,30,1,11,'',3.00,NULL,'7057687'),(429,'2019-10-02 12:20:28','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,13,44,30,1,11,'',3.00,NULL,'7057696'),(430,'2019-10-02 12:20:29','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,13,44,30,1,11,'',3.00,NULL,'7057697'),(431,'2019-10-02 12:28:44','[{\"id\": 438, \"nome\": \"Billy Mathews\", \"preco\": 12.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',15.00,13,44,30,1,11,'',3.00,NULL,'7057725'),(432,'2019-10-02 12:29:43','[{\"id\": 442, \"nome\": \"Bucth Cassidy\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,13,44,30,1,11,'',3.00,NULL,'7057727'),(433,'2019-10-02 12:29:43','[{\"id\": 442, \"nome\": \"Bucth Cassidy\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,13,44,30,1,11,'',3.00,NULL,'7057728'),(434,'2019-10-02 12:33:04','[{\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',13.00,13,44,30,1,11,'',3.00,NULL,'7057736'),(435,'2019-10-02 12:35:56','[{\"id\": 442, \"nome\": \"Bucth Cassidy\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,13,44,30,1,11,'',3.00,NULL,'7057748'),(436,'2019-10-02 12:46:09','[{\"id\": 439, \"nome\": \"Calamity Jane (Alcatra)\", \"preco\": 24.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 434, \"nome\": \"Sam Bass\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 432, \"nome\": \"Jim Killer\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 430, \"nome\": \"Henri Starr\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',48.00,13,44,30,1,11,'',3.00,NULL,'7058112'),(437,'2019-10-02 12:56:28','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,13,44,30,1,11,'',3.00,NULL,'7058773'),(438,'2019-10-02 12:57:24','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',13.00,13,44,30,1,11,'',3.00,NULL,'7058836'),(439,'2019-10-02 12:58:34','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',28.00,13,44,30,1,11,'',3.00,NULL,'7058992'),(440,'2019-10-02 13:02:38','[{\"id\": 439, \"nome\": \"Calamity Jane (Alcatra)\", \"preco\": 24.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',27.00,13,44,30,1,11,'',3.00,NULL,'7059246'),(441,'2019-10-02 13:06:01','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,13,44,30,1,11,'',3.00,NULL,'7059267'),(442,'2019-10-02 13:24:43','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',28.00,13,44,30,1,11,'',3.00,NULL,'7059424'),(443,'2019-10-02 13:26:21','[{\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,13,44,30,1,11,'',3.00,NULL,'7059453'),(444,'2019-10-02 14:17:21','[{\"id\": 427, \"nome\": \"Clay Alisson\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',17.00,13,44,30,1,11,'',3.00,NULL,'7059825'),(445,'2019-10-02 15:20:41','[{\"id\": 435, \"nome\": \"Wyatt Earp\", \"preco\": 8.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',11.00,13,44,30,1,11,'',3.00,NULL,'7060642'),(446,'2019-10-02 15:42:20','[{\"id\": 419, \"nome\": \"Fora da Lei\", \"preco\": 45.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',48.00,13,44,30,1,11,'',3.00,NULL,'7060718'),(447,'2019-10-02 16:05:26','[{\"id\": 429, \"nome\": \"Frank James\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',17.00,0,48,0,1,11,'',3.00,NULL,NULL),(448,'2019-10-02 16:06:36','[{\"id\": 418, \"nome\": \"Jim Killer\", \"preco\": 36.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',75.00,0,48,0,1,11,'',3.00,NULL,NULL),(449,'2019-10-02 16:23:34','[{\"id\": 437, \"nome\": \"Ben Thompson\", \"preco\": 15.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 4, \"complementos\": [], \"ingredientes\": []}]',63.00,0,49,0,1,11,'',3.00,NULL,NULL),(450,'2019-10-02 16:53:55','[{\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',13.00,14,49,0,1,11,'',3.00,NULL,'7061336'),(451,'2019-10-02 17:27:39','[{\"id\": 431, \"nome\": \"Jesse James\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,14,49,0,1,11,'',3.00,NULL,'7061470'),(452,'2019-10-02 22:07:21','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 4, \"complementos\": [], \"ingredientes\": []}]',8.00,14,49,0,1,11,'',3.00,27,'7064212'),(453,'2019-10-02 22:15:49','[{\"id\": 426, \"nome\": \"Billy the Kid\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',10.00,0,49,0,1,11,'',3.00,26,NULL),(454,'2019-10-03 03:31:12','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 4, \"complementos\": [], \"ingredientes\": []}]',23.00,14,49,0,1,11,'',3.00,NULL,'7064763'),(455,'2019-10-04 18:19:25','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,14,49,0,1,11,'',3.00,NULL,'7073728'),(456,'2019-10-04 23:58:14','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 4, \"complementos\": [], \"ingredientes\": []}]',23.00,14,49,0,1,11,'',3.00,NULL,'7075638'),(457,'2019-10-06 00:05:42','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,14,49,31,1,11,'',3.00,NULL,'7078140'),(458,'2019-10-07 03:08:55','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 4, \"complementos\": [], \"ingredientes\": []}]',23.00,14,49,32,1,11,'',3.00,NULL,'7081193'),(459,'2019-10-07 15:21:06','[{\"id\": 443, \"nome\": \"John Dillinger\", \"preco\": 16.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',19.00,20,51,0,1,11,'',3.00,NULL,'7083995'),(460,'2019-10-07 16:16:02','[{\"id\": 418, \"nome\": \"Jim Killer\", \"preco\": 36.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 3, \"complementos\": [], \"ingredientes\": []}]',111.00,0,53,0,1,11,'',3.00,NULL,NULL),(461,'2019-10-07 16:30:17','[{\"id\": 418, \"nome\": \"Jim Killer\", \"preco\": 36.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 3, \"complementos\": [], \"ingredientes\": []}]',67.80,22,53,0,1,11,'',3.00,28,'7084158'),(462,'2019-10-07 17:51:57','[{\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',12.00,23,55,36,1,11,'Garfos e facas',3.00,28,'7084451'),(463,'2019-10-07 19:25:33','[{\"id\": 422, \"nome\": \"Fritas Wanted\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,57,0,1,11,'',3.00,NULL,NULL),(464,'2019-10-07 19:34:49','[{\"id\": 422, \"nome\": \"Fritas Wanted\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,24,57,0,1,11,'',3.00,NULL,'7085488'),(465,'2019-10-07 23:06:29','[{\"id\": 439, \"nome\": \"Calamity Jane (Alcatra)\", \"preco\": 24.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',27.00,0,60,0,1,11,'',3.00,NULL,NULL),(466,'2019-10-07 23:08:29','[{\"id\": 439, \"nome\": \"Calamity Jane (Alcatra)\", \"preco\": 24.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 10, \"complementos\": [], \"ingredientes\": []}]',243.00,0,60,0,1,11,'',3.00,NULL,NULL),(467,'2019-10-07 23:16:26','[{\"id\": 428, \"nome\": \"Dick Turpin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,0,61,0,1,11,'',3.00,NULL,NULL),(468,'2019-10-07 23:17:58','[{\"id\": 428, \"nome\": \"Dick Turpin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,25,61,0,1,11,'Teste',3.00,NULL,'7086169'),(469,'2019-10-09 12:49:55','[{\"id\": 441, \"nome\": \"Annie Oakley\", \"preco\": 14.5, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',17.50,25,61,0,1,11,'',3.00,NULL,'7093748'),(470,'2019-10-09 14:08:26','[{\"id\": 442, \"nome\": \"Bucth Cassidy\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',17.00,0,62,0,1,11,'',3.00,NULL,NULL),(471,'2019-10-09 20:21:52','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',53.00,0,63,0,1,11,'',3.00,NULL,NULL),(472,'2019-10-10 04:24:33','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',18.00,26,63,0,1,11,'Teste de observacao',3.00,28,'7098686'),(473,'2019-10-10 22:41:13','[{\"id\": 435, \"nome\": \"Wyatt Earp\", \"preco\": 8.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}, {\"id\": 439, \"nome\": \"Calamity Jane (Alcatra)\", \"preco\": 24.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',27.00,26,63,37,1,11,'',3.00,28,'7103044'),(474,'2019-10-14 05:11:45','[{\"id\": 429, \"nome\": \"Frank James\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',17.00,0,65,0,1,11,'Teste back',3.00,NULL,NULL),(475,'2019-10-14 20:25:43','[{\"id\": 437, \"nome\": \"Ben Thompson\", \"preco\": 15.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',12.00,27,66,0,1,11,'',3.00,28,'7120117'),(476,'2019-10-17 19:33:29','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,28,68,0,1,11,'',3.00,NULL,'7142539'),(477,'2019-10-17 20:00:53','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,28,68,0,1,11,'',3.00,NULL,'7142791'),(478,'2019-10-17 20:05:28','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,28,68,0,1,11,'',3.00,NULL,'7142813'),(479,'2019-10-17 20:25:42','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,27,66,0,1,11,'',3.00,NULL,'127941614'),(480,'2019-10-18 20:12:57','[{\"id\": 441, \"nome\": \"Annie Oakley\", \"preco\": 14.5, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',17.50,0,68,0,1,11,'',3.00,NULL,NULL),(481,'2019-10-18 20:28:20','[{\"id\": 422, \"nome\": \"Fritas Wanted\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,28,68,0,1,11,'',3.00,NULL,'null'),(482,'2019-10-18 21:54:30','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',5.00,0,66,0,1,11,'',3.00,29,NULL),(483,'2019-10-18 22:08:20','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,27,66,0,1,11,'',3.00,NULL,'null'),(484,'2019-10-20 12:44:51','[{\"id\": 434, \"nome\": \"Sam Bass\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,28,68,0,1,11,'',3.00,NULL,'null'),(485,'2019-10-20 12:48:28','[{\"id\": 433, \"nome\": \"John Wesley Hardin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',10.00,28,68,0,1,11,'',3.00,NULL,'null'),(486,'2019-10-20 12:57:50','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,28,68,0,1,11,'',3.00,NULL,'null'),(487,'2019-10-20 13:02:59','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,28,68,0,1,11,'',3.00,NULL,'null'),(488,'2019-10-20 13:08:01','[{\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": 10.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',13.00,28,68,0,1,11,'',3.00,NULL,'null'),(489,'2019-10-20 13:09:55','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,29,68,0,1,11,'',3.00,NULL,'null'),(490,'2019-10-20 13:19:04','[{\"id\": 418, \"nome\": \"Jim Killer\", \"preco\": 36.0, \"variacoes\": [], \"precoTotal\": 36.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',39.00,29,68,0,1,11,'',3.00,NULL,'7154055'),(491,'2019-10-20 13:28:53','[{\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": 10.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',13.00,29,68,0,1,11,'',3.00,NULL,'null'),(492,'2019-10-20 13:31:29','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,29,68,0,1,11,'',3.00,NULL,'7154072'),(493,'2019-10-20 13:33:48','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,29,68,0,1,11,'',3.00,NULL,'7154076'),(494,'2019-10-20 13:37:04','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,28,68,0,1,11,'',3.00,NULL,'null'),(495,'2019-10-20 13:44:07','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,30,68,0,1,3,'',3.00,NULL,'128590273'),(496,'2019-10-20 14:47:43','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,31,68,0,1,6,'',3.00,NULL,'128600876'),(497,'2019-10-20 15:01:47','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,32,66,38,1,3,'',3.00,NULL,'128603202'),(498,'2019-10-20 17:48:51','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,32,66,38,1,3,'',3.00,NULL,'128630263'),(499,'2019-10-20 19:37:13','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,33,66,38,1,11,'Com ketchup e maionese',3.00,NULL,'128647843'),(500,'2019-10-22 23:45:25','[{\"id\": 431, \"nome\": \"Jesse James\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,31,68,0,1,6,'',3.00,NULL,'129311508'),(501,'2019-10-23 17:46:38','[{\"id\": 418, \"nome\": \"Jim Killer\", \"preco\": 36.0, \"variacoes\": [], \"precoTotal\": 36.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": 25.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',33.50,0,69,0,1,11,'',3.00,31,NULL),(502,'2019-10-23 20:48:14','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',8.00,32,66,38,1,3,'Teste yeaw',3.00,31,'129558242'),(503,'2019-10-23 20:50:17','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',5.50,33,66,38,1,6,'',3.00,31,'129558672'),(504,'2019-11-07 14:27:01','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,79,0,1,11,'',3.00,NULL,NULL),(505,'2019-11-07 14:41:04','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',5.50,34,79,0,1,6,'',3.00,32,'133758569'),(506,'2019-11-07 22:28:10','[{\"id\": 441, \"nome\": \"Annie Oakley\", \"preco\": 14.5, \"variacoes\": [], \"precoTotal\": 14.5, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',17.50,0,80,0,1,6,'',3.00,NULL,NULL),(507,'2019-11-08 12:24:00','[{\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,35,80,0,1,3,'',3.00,NULL,'134047424'),(508,'2019-11-08 12:25:58','[{\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',5.50,35,80,0,1,3,'',3.00,32,'134047902'),(509,'2019-11-08 12:26:49','[{\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',5.50,0,80,0,1,11,'',3.00,32,NULL),(510,'2019-11-08 12:28:44','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}, {\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 424, \"nome\": \"Wanted Ribs\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": 5.0, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',28.00,0,80,0,1,11,'',3.00,NULL,NULL),(511,'2019-11-10 19:46:28','[{\"id\": 416, \"nome\": \"Frank James\", \"preco\": 22.0, \"variacoes\": [], \"precoTotal\": 22.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',25.00,0,74,0,1,11,'',3.00,NULL,NULL),(512,'2019-11-10 19:57:33','[{\"id\": 416, \"nome\": \"Frank James\", \"preco\": 22.0, \"variacoes\": [], \"precoTotal\": 22.0, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',25.00,0,74,0,1,11,'',3.00,NULL,NULL),(513,'2019-11-10 20:56:51','[{\"id\": 435, \"nome\": \"Wyatt Earp\", \"preco\": 8.0, \"variacoes\": [], \"precoTotal\": 8.0, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',11.00,0,82,0,1,11,'',3.00,32,NULL),(514,'2019-11-10 21:58:38','[{\"id\": 445, \"nome\": \"Teste\", \"preco\": 100.0, \"variacoes\": [], \"precoTotal\": 130.0, \"quantidade\": 1, \"complementos\": [{\"id\": 405, \"nome\": \"cacto\", \"preco\": 25.0}, {\"id\": 404, \"nome\": \"beterraba\", \"preco\": 5.0}], \"ingredientes\": []}]',133.00,0,74,0,1,5,'',3.00,NULL,NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_estado`
--

DROP TABLE IF EXISTS `pedido_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_estado` (
  `id_pedido_estado` int(11) NOT NULL,
  `controle` varchar(50) DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pedido_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_estado`
--

LOCK TABLES `pedido_estado` WRITE;
/*!40000 ALTER TABLE `pedido_estado` DISABLE KEYS */;
INSERT INTO `pedido_estado` VALUES (1,'INICIAL','Aguardando pagamento'),(2,'MEIO','Pagamento efetuado'),(3,'FINAL','Pagamento recusado pela operadora do cartão'),(4,'MEIO','Aguardando confirmação'),(5,'MEIO','Pedido confirmado'),(6,'FINAL','Pedido não confirmado'),(7,'MEIO','Realizando estorno'),(8,'MEIO','Pedido em preparo'),(9,'MEIO','Esperando coleta'),(10,'MEIO','Saiu para entrega'),(11,'FINAL','Entregue');
/*!40000 ALTER TABLE `pedido_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta_seguranca`
--

DROP TABLE IF EXISTS `pergunta_seguranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pergunta_seguranca` (
  `id_pergunta_seguranca` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(500) NOT NULL,
  PRIMARY KEY (`id_pergunta_seguranca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta_seguranca`
--

LOCK TABLES `pergunta_seguranca` WRITE;
/*!40000 ALTER TABLE `pergunta_seguranca` DISABLE KEYS */;
INSERT INTO `pergunta_seguranca` VALUES (1,'Qual o nome do seu primeiro animal de estimação?'),(2,'Qual seu desenho animado favorito?'),(3,'Qual seu personagem de fantasia favorito?'),(4,'Qual sua cor favorita?'),(5,'Qual seu apelido de infância?');
/*!40000 ALTER TABLE `pergunta_seguranca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta_seguranca_usuario`
--

DROP TABLE IF EXISTS `pergunta_seguranca_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pergunta_seguranca_usuario` (
  `id_pergunta_seguranca` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `resposta` varchar(100) DEFAULT NULL,
  KEY `id_pergunta_seguranca` (`id_pergunta_seguranca`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pergunta_seguranca_usuario_ibfk_1` FOREIGN KEY (`id_pergunta_seguranca`) REFERENCES `pergunta_seguranca` (`id_pergunta_seguranca`),
  CONSTRAINT `pergunta_seguranca_usuario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta_seguranca_usuario`
--

LOCK TABLES `pergunta_seguranca_usuario` WRITE;
/*!40000 ALTER TABLE `pergunta_seguranca_usuario` DISABLE KEYS */;
INSERT INTO `pergunta_seguranca_usuario` VALUES (1,114,'12345'),(2,114,'12345'),(1,113,'Hatch'),(2,113,'Bob esponja'),(1,115,'Hatch'),(2,115,'Bob esponja'),(1,116,'Preto'),(2,116,'Gerico'),(1,117,'Preta'),(2,117,'Gerico'),(1,118,'Preta'),(2,118,'Gerico'),(1,119,'Preta'),(2,119,'Gerico'),(1,120,'Preto'),(2,120,'Gerico'),(1,121,'Preta'),(2,121,'Gerico');
/*!40000 ALTER TABLE `pergunta_seguranca_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pontos`
--

DROP TABLE IF EXISTS `pontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pontos` (
  `id_usuario` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `pontos` int(11) NOT NULL DEFAULT '0',
  `max` int(11) NOT NULL,
  KEY `fk_pontos_usuario1` (`id_usuario`),
  CONSTRAINT `fk_pontos_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontos`
--

LOCK TABLES `pontos` WRITE;
/*!40000 ALTER TABLE `pontos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurante`
--

DROP TABLE IF EXISTS `restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurante` (
  `id_restaurante` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `ultima_modificacao_itens` timestamp NOT NULL,
  PRIMARY KEY (`id_restaurante`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurante`
--

LOCK TABLES `restaurante` WRITE;
/*!40000 ALTER TABLE `restaurante` DISABLE KEYS */;
INSERT INTO `restaurante` VALUES (1,'MRFOOD','AVENIDA 32','2019-01-23 21:43:52');
/*!40000 ALTER TABLE `restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Típicas'),(2,'Regionais'),(3,'Japonesa'),(4,'Tradicional'),(5,'Especialidade'),(400,'A'),(401,'B'),(402,'c'),(403,'D'),(404,'E'),(405,'F'),(406,'G'),(407,'A21'),(408,'a22'),(409,'a23'),(410,'124');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `senha` varchar(150) NOT NULL,
  `token_sessao` varchar(150) DEFAULT NULL,
  `token_cadastro` varchar(10) DEFAULT NULL,
  `token_login_usuario` varchar(150) DEFAULT NULL,
  `token_login_segredo` varchar(150) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `verificado` tinyint(1) DEFAULT '0',
  `token_cadastro_data` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (0,'','','C9AA599D2381C2539C2C072F62F54FD6',NULL,'CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','B234E2F6F50A442B85E5E64D8926E01669775A6C25DAA2EBFDCFEC70979D815D',0,0,'2019-01-22 23:05:09'),(46,'+5596991100443?12-08-2019 20:40','root','F7918F7099CBD12D367E1FFFF75518F1','DFC686',NULL,NULL,1,1,'2019-08-10 19:59:15'),(47,'+5596992055072','',NULL,'5073E7',NULL,NULL,0,0,'2019-08-10 21:00:33'),(48,'2','12345','E9F15E917835CB6CE280531305482B47','2D2838',NULL,NULL,1,1,'2019-08-11 02:47:28'),(49,'1','','96C41C7A65EB19D5D7990DF820281C26','C8D9C4',NULL,NULL,0,1,'2019-08-10 21:39:42'),(50,'+5596991126476','',NULL,'90DFED',NULL,NULL,0,0,'2019-08-10 23:11:02'),(51,'3','12345',NULL,'6B4941',NULL,NULL,1,1,'2019-08-12 17:42:58'),(52,'4','12345','00A6676268F0C77FF2F1E668233D21B9','DDBD4F',NULL,NULL,1,1,'2019-08-12 18:17:41'),(53,'5','12345','D91CF695F525BCA4743A693A66C2A3EC','26FCB9',NULL,NULL,1,1,'2019-08-12 18:30:04'),(54,'+5591983517619?12-08-2019-20:44','12345','6938401DB50A6EE6F7303297E26FDDCA','7373D9',NULL,NULL,1,1,'2019-08-12 18:52:21'),(55,'+5596983517619','',NULL,'38CF8D',NULL,NULL,0,0,'2019-08-12 21:33:17'),(56,'+5591983517619?12-08-2019-21:55','gerico14599','25D5E1C685EDB9A2F379E18E78BE98A8','691AA0',NULL,NULL,1,1,'2019-08-12 21:34:12'),(57,'+5591983517619?13-08-2019-00:52','gerico14599','B18C9DA16BE9013F5C70F7C677008FDD','7F1AB2',NULL,NULL,1,1,'2019-08-12 22:52:02'),(58,'+5596981105390?13-08-2019-00:53','gerico14599','8311A1FFF9440386F2714A2143713138','888382',NULL,NULL,1,1,'2019-08-12 23:02:23'),(59,'+5591983517619?13-08-2019-01:32','gerico14599','8991AD4A7ED33C4C9FD53EB159C85CED','C8DDAE',NULL,NULL,1,1,'2019-08-13 00:54:54'),(60,'+5591983517619?13-08-2019-14:45','gerico14599','214CE3DB01552F93943C55B6AC8CEDFD','1E9B09',NULL,NULL,1,1,'2019-08-13 02:59:07'),(61,'+5591983517619?13-08-2019-20:16','12345',NULL,'E1B853',NULL,NULL,1,1,'2019-08-13 14:46:45'),(62,'+5596981212109?13-08-2019-20:16','12345678',NULL,'6A0D45',NULL,NULL,1,1,'2019-08-13 17:03:57'),(63,'+5591983517619?13-08-2019-20:53','12345',NULL,'D1C61B',NULL,NULL,1,1,'2019-08-13 20:17:23'),(64,'+5591983517619?26-08-2019-03:59','gerico14599',NULL,'BA6785','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','B234E2F6F50A442B85E5E64D8926E01669775A6C25DAA2EBFDCFEC70979D815D',1,1,'2019-08-13 21:06:36'),(65,'+5596981243468?04-09-2019-17:58','12345678','C1E33E62B0925CB1E04551ECEE810D1D','FDACA9','C444E58543379A1470B912F98B20F361C47809237A4EC9951BFDB8C2CFC7A328','EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F',1,1,'2019-08-13 21:25:41'),(66,'+5596981165519','6644b9d48cce52336570c43005517abb27c5ee516325aeac27a7f5297b88a845','11186FF634204D311CB7B2EC88E36D62','705F19','54510CCCE8897D646A604D0E8EC835097F7C3EC64326519D0B28C7973E67C6E2','76CE419A19637E62FAE2666CB86E8BDC91D6C9F5C59D40AFA7EED6A724BB416C',1,1,'2019-10-23 17:36:40'),(67,'+5591983517619?26-08-2019-13:39','12345','F25C5F17EEB1AB365B4B608133091C58','A634F4','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 13:31:24'),(68,'+5596991100443?26-08-2019-12:57','12345','98D9E74726073C68C93CD91926AEFE28','6A62DC','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 12:29:53'),(69,'+5596991100443?26-08-2019-13:08','12345678',NULL,'620E2D','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F',1,1,'2019-08-26 13:06:13'),(70,'+5596991100443?26-08-2019-13:25','12345',NULL,'0B9C48','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 13:10:03'),(71,'+5596991100443?02-09-2019-03:40','12345','EE45EDDE5B9F79A501B6507DC4FF9789','F095E3','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 13:27:48'),(72,'+5591983517619?26-08-2019-14:59','12345','3AA859255BDC2D271BB1BA53707D87F4','953FFF','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 13:39:39'),(73,'+5596991781167?14-10-2019-20:12','12345','ACFA2C6EEA9E734F318695E007825958','10E264','E73FC72D67E23C793D1FC7B89FAC6460B2D36CA5574AE913E04D8CB68F7CEA89','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 15:01:15'),(74,'+5591983517619?03-09-2019-03:31','12345','D98132EFCDCED3A95CB9659FAC85CA8E','5E7B80','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 15:59:41'),(75,'+5596991100443?07-10-2019-19:17','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','B8DFD60C96325120162366ED821596B9','B787FB','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-09-02 03:41:20'),(76,'+5591983517619?26-09-2019-21:26','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'683FD9','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-09-03 03:32:01'),(77,'+5596981243468','',NULL,'55F93B',NULL,NULL,0,0,'2019-09-06 05:15:59'),(78,'+5596999099674?07-10-2019-19:17','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','6A4BDD8EFF9FF693F704F0ED2304F52D','3539B8','97A8411DB82D1A421394DD679FF0488AF35230C6BBF753B97CD836E7AF825ECB','FEF3D83E32B4D981B0C0F75206E891268C6AA8BD8DB5A315DB7BF24168A4BE27',1,1,'2019-09-21 16:04:00'),(79,'+5591983517619?02-10-2019-15:48','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','70CFBCA079D855F7F185C080DD857856','6E33AA','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-09-26 21:27:18'),(80,'+5511970548934?14-10-2019-20:10','ab3826dcb6375c733b2e32dc1dd83a7f5940e0ab4b695ebe6715a4c4a22b540d','F2D988A686830629194985E7A32D43E3','D36A9E','66B974747E1E8D5A1BA343F0AE4A526180D168E10D50252FF4681D9432F94BD1','EBEB1635B6A769D417D9B0A70C0A96DBB384FE4D307E0A961E4884648DC8FBB6',1,1,'2019-09-30 18:17:33'),(81,'+5596981286260?14-10-2019-20:12','5a934d9cf05be4f974c57d943058b4d773dd2de644236deea06b1521be6f9b6f','ADDACAA6F76D589AF9A569C30D7BE2B3','A6EBAE','D6FFFB17C792F102005C4D121D894937876F4CB2D7DB26B11AD740E5ED9535DB','F7DC5DF6A262B6B09A62FCC351513EAF076B071BEB46B90BD8F682284BE63E8D',1,1,'2019-10-01 23:08:08'),(82,'+5591983517619?02-10-2019-16:03','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','E18D7CB5F334DAED5685CEC2AF9DD00C','5739C8','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-02 15:49:49'),(83,'+5591983517619?02-10-2019-16:21','b234e2f6f50a442b85e5e64d8926e01669775a6c25daa2ebfdcfec70979d815d','DC77D5B21714A3D84E1ADFE7D40CB299','80C3FA','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','EEB57D08AA725B6C02C80184281CB2558C0F7AACFB7284FF418BAB27DDC37624',1,1,'2019-10-02 16:03:50'),(84,'+5591983517619?07-10-2019-12:29','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','A5B526D4EB3DEE807FF01AE75A061EAA','0D0731','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-02 16:21:59'),(85,'+5596984109393?07-10-2019-14:50','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','961E08071C3725D1AF15301F5318B695','C232F5','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-07 14:37:40'),(86,'+5596984109393?07-10-2019-15:35','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','43A4B1BBC9BC19EC8326290CDBA769EB','F4536A','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-07 15:07:09'),(87,'+5596984180939','',NULL,'C5F14D',NULL,NULL,0,0,'2019-10-07 15:00:28'),(88,'+5596984109393?07-10-2019-15:37','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'30D992','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-07 15:35:47'),(89,'+5596984109393?07-10-2019-16:38','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'2BFA31','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-07 15:55:18'),(90,'+5596984109393?07-10-2019-17:00','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','EA82CBE6B6FC02A4EE314DCED9BF4F91','20EEEE','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-07 16:38:57'),(91,'+5596984109393?07-10-2019-19:41','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'8E0CFE','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-07 17:37:10'),(92,'+5596991190883?14-10-2019-20:12','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,'F02273','A8E12E2EA315AED178938707245BDF1E020489A48FBB6774C979F933B42DBDB3','49DC52E6BF2ABE5EF6E2BB5B0F1EE2D765B922AE6CC8B95D39DC06C21C848F8C',1,1,'2019-10-07 19:10:17'),(93,'+5596999099674?14-10-2019-20:12','cafdf79439b51bf00a27e41332221878483e68f1692522faf5bf5f22307104e5','20DF927C1E72BA820700FE43A0CA1FC0','2BD7B5','97A8411DB82D1A421394DD679FF0488AF35230C6BBF753B97CD836E7AF825ECB','E2F51F297F364F58E2A253976AAA50640B78512805FDA6FA7A1325AD932DD664',1,1,'2019-10-07 19:20:07'),(94,'+5596991100443?07-10-2019-22:59','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',NULL,'7E0A4E','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','FEF3D83E32B4D981B0C0F75206E891268C6AA8BD8DB5A315DB7BF24168A4BE27',1,1,'2019-10-07 19:20:13'),(95,'+5596984109393?07-10-2019-21:26','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'E38ACB','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-07 21:13:26'),(96,'+5596984109393?09-10-2019-12:52','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','ADAD038C4186029A8593B9B6F061A7BF','59011B','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-07 21:26:29'),(97,'+5596991100443?14-10-2019-20:13','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','41649405730512852F9DCEBB03A55FFF','7F6272','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','FEF3D83E32B4D981B0C0F75206E891268C6AA8BD8DB5A315DB7BF24168A4BE27',1,1,'2019-10-07 23:04:14'),(98,'+5596984109393?09-10-2019-20:02','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'FBA8C4','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-09 12:53:52'),(99,'+5596984109393?14-10-2019-00:27','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'25D216','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-09 20:15:27'),(100,'+5596984109393?14-10-2019-04:50','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'ADD8C0','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-14 00:42:37'),(101,'+5596984109393?14-10-2019-20:13','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','BB3F80B615ED1D5D3F46C43240613C56','68A964','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-14 04:51:18'),(102,'+5512982180515','','7C63B795E05AA30C0696E14A5FA9EAF0','4AF950',NULL,NULL,0,1,'2019-10-14 19:06:00'),(103,'+5596984109393?25-10-2019-21:23','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'BF33B8','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-14 20:20:46'),(104,'+5596991100443?22-10-2019-23:44','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225','8D828263046E1D00ED675628F54BF4F2','3F0E7E','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','ED92E4C7E54E3F4A29D8041EC93124BD3C1EC4825701CAC42B3FFFAF0BD7120A',1,1,'2019-10-14 21:09:07'),(105,'+5511986450011','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','E11B7C2DFF1BADB52B6D1B741BB97813','884463','5BF4B438763369EFCB5B988BDA7D0F797D1FDB687FD917604B9720C807854C4D','FEF3D83E32B4D981B0C0F75206E891268C6AA8BD8DB5A315DB7BF24168A4BE27',1,1,'2019-10-15 22:02:31'),(106,'+5596994109393','',NULL,'B7C441',NULL,NULL,0,0,'2019-10-20 17:39:54'),(107,'+5596991206123','','A7E0FD303902205A6858580EDB7FAF7E','8CAB91',NULL,NULL,0,1,'2019-10-23 13:56:22'),(108,'+5596984109393?27-10-2019-21:48','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','D3AA59EFB27FA09189FD3135C28050CA','AA9382','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-10-25 21:23:26'),(109,'+5596999099674','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','7492009045FF4FBD1BB51030B5270EE0','A213DB','97A8411DB82D1A421394DD679FF0488AF35230C6BBF753B97CD836E7AF825ECB','FEF3D83E32B4D981B0C0F75206E891268C6AA8BD8DB5A315DB7BF24168A4BE27',1,1,'2019-10-26 14:39:02'),(110,'+5596984109393?01-11-2019-12:15','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'3300DD','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-11-01 12:04:18'),(111,'+5596991100443?02-11-2019-00:46','12345','37EA593FBDA47F946C37E538AAF3FB8A','A6D8F8','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-11-02 00:42:05'),(112,'+5596984107373','',NULL,'788965',NULL,NULL,0,0,'2019-11-01 02:26:35'),(113,'+5596984109393?03-11-2019-20:55','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'885C96','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-11-03 20:45:38'),(114,'+5596991100443','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5','037912F1C0C20012CFC39FE695B9A415','4BAF97','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-11-08 02:58:45'),(115,'+5596984109393?06-11-2019-19:53','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'1721CA','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-11-06 19:49:26'),(116,'+5596984109393?07-11-2019-12:57','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'7B5613','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-11-07 12:26:29'),(117,'+5596984109393?07-11-2019-14:02','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'2BF910','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-11-07 12:59:32'),(118,'+5596984109393?07-11-2019-20:12','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','BEC50CB79F4C2A9AA5CC960DD88E0371','B81648','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-11-07 14:24:45'),(119,'+5596984109393?10-11-2019-18:24','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'05D4D8','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-11-07 20:12:41'),(120,'+5596984109393?10-11-2019-20:18','b234e2f6f50a442b85e5e64d8926e01669775a6c25daa2ebfdcfec70979d815d',NULL,'43A923','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','EEB57D08AA725B6C02C80184281CB2558C0F7AACFB7284FF418BAB27DDC37624',1,1,'2019-11-10 18:24:27'),(121,'+5596984109393','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','7380A05FD9FE2DDC48D041C89353A024','7A8583','583DF1B8C0C3203A0293D4F8B86D47A43C30811CE05182FB8C57D4FB5ADA5205','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-11-10 20:48:39');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_admin`
--

DROP TABLE IF EXISTS `usuario_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_admin` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `senha` varchar(150) NOT NULL,
  `token_sessao` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_admin`
--

LOCK TABLES `usuario_admin` WRITE;
/*!40000 ALTER TABLE `usuario_admin` DISABLE KEYS */;
INSERT INTO `usuario_admin` VALUES (1,'wantedadmin','ZXDas7966mby@','F19A65736E2F5CDCB8AE349F19AE5026');
/*!40000 ALTER TABLE `usuario_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variacao`
--

DROP TABLE IF EXISTS `variacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variacao` (
  `id_variacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `ordem` int(11) DEFAULT NULL,
  `id_grupo_variacao` int(11) NOT NULL,
  PRIMARY KEY (`id_variacao`),
  KEY `fk_variacao_grupo_variacao1_idx` (`id_grupo_variacao`),
  CONSTRAINT `fk_variacao_grupo_variacao1` FOREIGN KEY (`id_grupo_variacao`) REFERENCES `grupo_variacao` (`id_grupo_variacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variacao`
--

LOCK TABLES `variacao` WRITE;
/*!40000 ALTER TABLE `variacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `variacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websocket`
--

DROP TABLE IF EXISTS `websocket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `websocket` (
  `id_cliente` int(11) NOT NULL,
  `token` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_websocket_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_websocket_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websocket`
--

LOCK TABLES `websocket` WRITE;
/*!40000 ALTER TABLE `websocket` DISABLE KEYS */;
INSERT INTO `websocket` VALUES (0,NULL),(17,NULL),(18,'D871D9A751D4438CA12260D213527484'),(19,NULL),(20,NULL),(21,NULL),(22,'03D5293EE7F0BE9F441BB9C86C4A8F67'),(23,'EAD5E8059D72962179F8A1568911F011'),(24,NULL),(25,'F440A74B2779E6BCED7933D9AA0F93F9'),(26,'4CCADA71161316C3B874AC09FFC34BA7'),(27,NULL),(28,'1C442356568BB934A39575D90A5F505D'),(29,NULL),(30,NULL),(31,'7772AFA690F6E30F6AA4DC85CF8F58F7'),(32,NULL),(33,NULL),(34,NULL),(35,NULL),(36,NULL),(37,NULL),(38,'509EC83CF014EA9F9746C686A806EAB3'),(39,'A29A7C1E891EB17F62202978681FCC17'),(40,'5D0ADEF3A5E46D23965DFDFF84103EF2'),(41,'84A9F89F82B6310CE0CA5BA486DA7C09'),(42,'67BCCF600C6D164BA19E63037ED2CC35'),(43,NULL),(44,'298413931DE997CABF71A3D325A1B4AE'),(45,NULL),(46,'E1ADF44F5EB879FE6C2CCD42378CBE41'),(47,NULL),(48,'60F48F5505FD9E4153AF0406851C407E'),(49,'26A762739F2E4311D074F49EA6E2695D'),(50,NULL),(51,'D90B167FCD19BBB93ED89EC4F2D033E7'),(52,NULL),(53,'8D87BCD2021CDAFDE213EA964CEA72EB'),(54,NULL),(55,'FC55B71E6BBAB2943DE695209D8F209F'),(56,NULL),(57,'A17DF7756518DA59C006FD748D26C7B5'),(58,NULL),(59,NULL),(60,'301F2FAE94B6C423CD9D426336B742DF'),(61,'00CF1C639F1FC09CBBB5E62919445743'),(62,'4005A1888388D21A81D5374C4785AFAC'),(63,'42C5C485E175A178C2FB51CD7014B97C'),(64,NULL),(65,'FE7E699246FCE8F5CD57032301EFA640'),(66,'1CA0E82F13C5A78831EFAC10EE861833'),(67,NULL),(68,'095A429726D2F23E8D7B858491AF97E6'),(69,'102C8E42F1B3FFAA07E704F2144820E5'),(70,NULL),(71,NULL),(72,NULL),(73,NULL),(74,'A4FD1C59F8678EC7933A01B14FEAE62A'),(75,NULL),(76,NULL),(77,NULL),(78,NULL),(79,'816D9F5D3861C6096995C4987D955D3B'),(80,'3BA7C6AB1C53F5DA56EB4AD3A4C36BE1'),(81,NULL),(82,'E4424FC4F8323DB5A6221053803A87B0');
/*!40000 ALTER TABLE `websocket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websocket_admin`
--

DROP TABLE IF EXISTS `websocket_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `websocket_admin` (
  `id_usuario` int(11) NOT NULL,
  `token` varchar(150) NOT NULL,
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `websocket_admin_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_admin` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websocket_admin`
--

LOCK TABLES `websocket_admin` WRITE;
/*!40000 ALTER TABLE `websocket_admin` DISABLE KEYS */;
INSERT INTO `websocket_admin` VALUES (1,'F19A65736E2F5CDCB8AE349F19AE5026');
/*!40000 ALTER TABLE `websocket_admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-10 22:06:22

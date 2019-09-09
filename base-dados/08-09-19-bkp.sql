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
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivo`
--

LOCK TABLES `arquivo` WRITE;
/*!40000 ALTER TABLE `arquivo` DISABLE KEYS */;
INSERT INTO `arquivo` VALUES (426,NULL),(427,NULL),(428,NULL),(429,NULL),(430,NULL),(431,NULL),(432,NULL),(433,NULL),(434,NULL),(435,NULL),(436,NULL),(437,NULL),(438,NULL),(439,NULL),(440,NULL),(441,NULL),(442,NULL),(443,NULL),(444,NULL),(445,NULL),(446,NULL),(447,NULL),(448,NULL),(449,NULL),(450,NULL),(451,NULL),(452,NULL),(453,NULL),(454,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (0,'','','','',0),(17,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',46),(18,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',48),(19,'argerio queiroz','02295260205','+5591983517619','argerioaf@gmail.com',51),(20,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',52),(21,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',53),(22,'argério','02295260205','+5591983517619','argerioaf@gmail.com',54),(23,'argério','02295260205','+5591983517619','argerioaf@gmail.com',56),(24,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',57),(25,'teste','02295260205','+5596981105390','argerioaf@gmail.com',58),(26,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',59),(27,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',60),(28,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',61),(29,'amon','02811511300','+5596981212109','Amon.ufc@gmail.com',62),(30,'Argério','02295260205','+5591983517619','argerioaf@gmail.com',63),(31,'Argerio','02295260205','+5591983517619','argerioaf@gmail.com',64),(32,'Renan Mescouto','02782267280','+5596981243468','renanmescouto123@gmail.com',65),(33,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',68),(34,'PAULO HENRIQUE','01741053200','+5596991100443','henrique.phgb@gmail.com',69),(35,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',70),(36,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',71),(37,'Argerio','02295260205','+5591983517619','argerioaf@gmail.com',67),(38,'Argerio Queiroz','02295260205','+5591983517619','argerioaf@gmail.com',72),(39,'Elza Moura Uchoa','56430663272','+5596991781167','uchoa.moura@hotmail.com',73),(40,'Argério','02295260205','+5591983517619','argerioaf@gmail.com',74),(41,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',75),(42,'Argério','02295260205','+5591983517619','argerioaf@gmail.com',76);
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
  `id_arquivo` int(11) NOT NULL,
  PRIMARY KEY (`id_complemento`),
  KEY `fk_complemento_arquivo1_idx` (`id_arquivo`),
  CONSTRAINT `fk_complemento_arquivo1` FOREIGN KEY (`id_arquivo`) REFERENCES `arquivo` (`id_arquivo`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complemento`
--

LOCK TABLES `complemento` WRITE;
/*!40000 ALTER TABLE `complemento` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupomdesconto`
--

LOCK TABLES `cupomdesconto` WRITE;
/*!40000 ALTER TABLE `cupomdesconto` DISABLE KEYS */;
INSERT INTO `cupomdesconto` VALUES (1,3,'gericozinho','desconto de brother',1,'2019-08-26 00:00:00',1,0,10.00),(2,3,'teste1','teste',1,'2019-08-27 00:00:00',1,0,10.00),(3,1,'NOVATO','desconto para usuÃ¡rios novos no aplicativo Wanted',2,'2019-08-30 00:00:00',1,0,10.00),(4,3,'novato2','desconto para usuÃ¡rios novos no aplicativo Wanted',1,'2019-08-28 00:00:00',1,0,10.00),(5,3,'menos30','desconto de 30% no seu pedido',1,'2019-08-28 00:00:00',1,1,30.00),(6,3,'menos50','desconto de 50%',3,'2019-08-28 00:00:00',1,1,50.00),(7,3,'menos40','desconto de 40%',1,'2019-08-28 00:00:00',1,1,40.00),(8,3,'bemvindo','desconto de 50% no pedido para primeiros usuÃ¡rios, seja bem vindo a wanted e aproveite sua promoÃ§Ã£o',3,'2019-08-28 00:00:00',1,1,50.00),(9,3,'Menos502','desconto de 50%',1,'2019-08-28 00:00:00',1,1,50.00),(10,3,'amon','Cupom de 70% de desconto',0,'2019-08-28 00:00:00',1,1,70.00),(11,3,'amon2','Desconto de 70%',1,'2019-08-28 00:00:00',1,1,70.00),(12,3,'paulete','desconto do Paulete de 50 conto',100,'2019-09-30 00:00:00',1,0,50.00),(13,3,'35m','35%',100,'2019-09-30 00:00:00',1,1,35.00),(14,1,'Setembro30','Desconto: R$ 30,00',50,'2019-09-25 00:00:00',1,0,30.00),(15,3,'Setembro40','Desconto: R$ 40,00',50,'2019-09-25 00:00:00',1,0,40.00),(16,3,'menos60','60%',400,'2019-09-24 00:00:00',1,1,60.00),(17,3,'15zao','15%',100,'2019-09-30 00:00:00',1,1,15.00);
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
INSERT INTO `cupomdesconto_cliente` VALUES (31,2,0,0),(31,4,0,0),(31,5,1,0),(31,6,0,0),(38,6,0,1),(38,7,0,1),(38,8,0,1),(38,9,1,0),(39,6,1,0),(40,11,1,0),(42,12,0,1),(42,13,0,1),(42,15,0,1),(42,16,0,1),(42,17,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (0,0,'','','','','','','Buscar no local',0),(20,22,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(21,23,'Rua Euclides Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(22,25,'R. Euclídes Rodrigues','Central','De esquina com Av José de Anchieta','388','Santana','68925192','Minha casa',0),(23,26,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(24,28,'R. Pedro Siqueira Um','Universidade','Faculdade metq','180','Macapá','68925192','Faculdade',0),(25,31,'Rod. Duca Serra - Cabralzinho','Laguinho','Faculdade','55','Macapá','445555555','Argerio Queiroz',0),(26,31,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(27,39,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(28,40,'Euclides Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(29,42,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0);
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
INSERT INTO `enderecos_favoritos` VALUES (17,0),(18,0),(19,0),(20,0),(21,0),(24,0),(27,0),(29,0),(30,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(40,0),(41,0),(22,20),(23,21),(25,22),(26,23),(28,24),(31,25),(39,27),(42,29);
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
  `controle` varchar(50) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id_formapagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
INSERT INTO `formapagamento` VALUES (0,'DINHEIRO','A dinheiro'),(2,'PAGSEGURO','Cartao Credito - PagSeguro');
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
INSERT INTO `formapagamentos_favoritas` VALUES (0,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(37,0),(33,0),(34,0),(35,0),(36,0),(38,0),(39,0),(40,0),(41,0),(42,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Bebidas'),(2,'Verdes'),(3,'Carnes'),(4,'Molhados'),(5,'Secos'),(6,'Doces'),(7,'Salgados'),(400,'Teste'),(401,'Teste2'),(402,'Combos'),(403,'Entradas'),(404,'Hamburgueres'),(405,'Massas'),(406,'Pratos Executivos'),(407,'Vegetarianos');
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
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (416,'Frank James','...',22.00,402,0,0,'muito tempo'),(417,'Belle Starr','...',25.00,402,0,0,''),(418,'Jim Killer','...',36.00,402,0,0,''),(419,'Fora da Lei','...',45.00,402,0,0,''),(420,'Fritas Bonnie & Clyde','...',5.00,403,0,0,''),(421,'Fritas Dupla','...',5.00,403,0,0,''),(422,'Fritas Wanted','...',5.00,403,0,0,''),(423,'Onion Ring','...',5.00,403,0,0,''),(424,'Wanted Ribs','...',5.00,403,0,0,''),(425,'Belle Starr','...',7.00,404,0,0,''),(426,'Billy the Kid','...',7.00,404,0,0,''),(427,'Clay Alisson','...',7.00,404,0,0,''),(428,'Dick Turpin','...',7.00,404,0,0,''),(429,'Frank James','...',7.00,404,0,0,''),(430,'Henri Starr','...',7.00,404,0,0,''),(431,'Jesse James','...',0.00,404,0,0,''),(432,'Jim Killer','...',7.00,404,0,0,''),(433,'John Wesley Hardin','...',7.00,404,0,0,''),(434,'Sam Bass','...',7.00,404,0,0,''),(435,'Wyatt Earp','...',8.00,404,0,0,''),(436,'Xerrif Willian J. Brady','...',10.00,404,0,0,''),(437,'Ben Thompson','...',15.00,405,0,0,''),(438,'Billy Mathews','...',12.00,405,0,0,''),(439,'Calamity Jane (Alcatra)','...',24.00,406,0,0,''),(440,'Pat Garret (Picanha)','...',35.00,406,0,0,''),(441,'Annie Oakley','...',14.50,407,0,0,'Alguns minutos'),(442,'Bucth Cassidy','...',7.00,407,0,0,''),(443,'John Dillinger','...',16.00,407,0,0,''),(444,'Tom Horn','...',15.50,407,0,0,'');
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
INSERT INTO `item_arquivo` VALUES (416,426),(417,427),(418,428),(419,429),(420,430),(421,431),(422,432),(423,433),(424,434),(425,435),(426,436),(427,437),(428,438),(429,439),(430,440),(431,441),(432,442),(433,443),(434,444),(435,445),(436,446),(437,447),(438,448),(439,449),(440,450),(441,451),(442,452),(443,453),(444,454);
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
INSERT INTO `item_tipo` VALUES (441,5);
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
INSERT INTO `itens_favoritos` VALUES (31,416),(42,416),(42,417),(31,420),(39,420),(42,420),(39,422),(31,423),(42,423);
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
INSERT INTO `notificacao` VALUES (1,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 357, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(2,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 357, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(3,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 2, \"id_pedido\": 358, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento efetuado\"}',1),(4,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 358, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento não efetuado\"}',1),(5,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 358, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(6,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 358, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(7,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 358, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(8,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 7, \"id_pedido\": 358, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Realizando estorno\"}',1),(9,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 358, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(10,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 358, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(11,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 358, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(12,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 358, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(13,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 2, \"id_pedido\": 359, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento efetuado\"}',1),(14,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 359, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento não efetuado\"}',1),(15,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 359, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(16,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 359, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(17,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 359, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(18,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 7, \"id_pedido\": 359, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Realizando estorno\"}',1),(19,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 359, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(20,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 359, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(21,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 359, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(22,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 359, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(23,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 2, \"id_pedido\": 360, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento efetuado\"}',1),(24,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 360, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento não efetuado\"}',1),(25,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 360, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(26,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 360, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(27,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 360, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(28,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 7, \"id_pedido\": 360, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Realizando estorno\"}',1),(29,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 360, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(30,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 360, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(31,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 360, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(32,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 360, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(33,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 2, \"id_pedido\": 361, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento efetuado\"}',1),(34,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 361, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento não efetuado\"}',1),(35,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 361, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(36,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 361, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(37,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 361, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(38,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 7, \"id_pedido\": 361, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Realizando estorno\"}',1),(39,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 361, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(40,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 361, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(41,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 361, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(42,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 361, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(43,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 2, \"id_pedido\": 362, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento efetuado\"}',1),(44,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 3, \"id_pedido\": 362, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pagamento não efetuado\"}',1),(45,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 4, \"id_pedido\": 362, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Aguardando confirmação\"}',1),(46,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 362, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(47,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 362, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(48,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 7, \"id_pedido\": 362, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Realizando estorno\"}',1),(49,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 362, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(50,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 362, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(51,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 362, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(52,38,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 362, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(53,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 364, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(54,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 364, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(55,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 364, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(56,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 364, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(57,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 364, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(58,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 365, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(59,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 365, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(60,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 365, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(61,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 365, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(62,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 365, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(63,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 366, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(64,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 366, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(65,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 366, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(66,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 366, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(67,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 366, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(68,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 367, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(69,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 368, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(70,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 368, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(71,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 368, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(72,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 368, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(73,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 368, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(74,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 369, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(75,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 369, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(76,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 369, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(77,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 369, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(78,41,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 369, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(79,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 370, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(80,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 370, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(81,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 370, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(82,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 370, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(83,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 370, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(84,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 371, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(85,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 371, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(86,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 371, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(87,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 371, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(88,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 371, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(89,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 372, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(90,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 372, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(91,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 372, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(92,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 372, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(93,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 372, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(94,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 373, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(95,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 373, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(96,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 373, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(97,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 373, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(98,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 373, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(99,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 374, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(100,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 374, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(101,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 374, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(102,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 374, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(103,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 374, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(104,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 375, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(105,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 375, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(106,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 375, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(107,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 375, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(108,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 375, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1),(109,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 6, \"id_pedido\": 376, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido não confirmado\"}',1),(110,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 5, \"id_pedido\": 377, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido confirmado\"}',1),(111,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 8, \"id_pedido\": 377, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Pedido em preparo\"}',1),(112,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 9, \"id_pedido\": 377, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Esperando coleta\"}',1),(113,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 377, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',1),(114,42,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 11, \"id_pedido\": 377, \"estado_controle\": \"FINAL\", \"estado_descricao\": \"Entregue\"}',1);
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
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_formapagamento1_idx` (`id_formapagamento`),
  KEY `fk_pedido_cliente1_idx` (`id_cliente`),
  KEY `fk_pedido_endereco1_idx` (`id_endereco`),
  KEY `id_cupomdesconto` (`id_cupomdesconto`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_pedido_endereco1` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_pedido_formapagamento1` FOREIGN KEY (`id_formapagamento`) REFERENCES `formapagamento` (`id_formapagamento`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cupomdesconto`) REFERENCES `cupomdesconto` (`id_cupomdesconto`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (357,'2019-08-23 17:53:08','[{\"id\": 407, \"nome\": \"Belle Starr\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,31,0,1,11,'',3.00,NULL),(358,'2019-08-24 19:59:58','[{\"id\": 416, \"nome\": \"Frank James\", \"preco\": 22.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',25.00,0,31,0,1,11,'Com molho',3.00,NULL),(359,'2019-08-24 20:49:49','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',53.00,0,31,0,1,11,'Sem cuspe e sem suor',3.00,NULL),(360,'2019-08-26 13:47:21','[{\"id\": 440, \"nome\": \"Pat Garret (Picanha)\", \"preco\": 35.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',20.50,0,38,0,1,11,'',3.00,6),(361,'2019-08-26 13:58:51','[{\"id\": 440, \"nome\": \"Pat Garret (Picanha)\", \"preco\": 35.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',24.00,0,38,0,1,11,'',3.00,7),(362,'2019-08-26 14:14:16','[{\"id\": 440, \"nome\": \"Pat Garret (Picanha)\", \"preco\": 35.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',20.50,0,38,0,1,11,'',3.00,8),(363,'2019-08-26 15:39:51','[{\"id\": 434, \"nome\": \"Sam Bass\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 422, \"nome\": \"Fritas Wanted\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',9.00,0,39,0,1,1,'Sem salada',3.00,6),(364,'2019-09-02 03:42:59','[{\"id\": 431, \"nome\": \"Jesse James\", \"preco\": 0.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 422, \"nome\": \"Fritas Wanted\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,41,0,1,11,'',3.00,NULL),(365,'2019-09-03 03:36:08','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',3.00,0,42,0,1,11,'',3.00,12),(366,'2019-09-03 03:38:15','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 418, \"nome\": \"Jim Killer\", \"preco\": 36.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 443, \"nome\": \"John Dillinger\", \"preco\": 16.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 429, \"nome\": \"Frank James\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 428, \"nome\": \"Dick Turpin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',109.00,0,42,0,1,11,'',3.00,NULL),(367,'2019-09-03 03:40:11','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 436, \"nome\": \"Xerrif Willian J. Brady\", \"preco\": 10.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 421, \"nome\": \"Fritas Dupla\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 418, \"nome\": \"Jim Killer\", \"preco\": 36.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 443, \"nome\": \"John Dillinger\", \"preco\": 16.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 429, \"nome\": \"Frank James\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 428, \"nome\": \"Dick Turpin\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',109.00,0,42,0,1,6,'',3.00,NULL),(368,'2019-09-03 15:11:05','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,42,0,1,11,'',3.00,NULL),(369,'2019-09-03 16:22:24','[{\"id\": 441, \"nome\": \"Annie Oakley\", \"preco\": 14.5, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',17.50,0,41,0,1,11,'',3.00,NULL),(370,'2019-09-03 18:26:38','[{\"id\": 426, \"nome\": \"Billy the Kid\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',7.55,0,42,0,1,11,'',3.00,13),(371,'2019-09-03 20:52:05','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',3.00,0,42,0,1,11,'',3.00,15),(372,'2019-09-03 21:06:04','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,42,0,1,11,'',3.00,NULL),(373,'2019-09-06 16:38:08','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,42,0,1,11,'',3.00,NULL),(374,'2019-09-06 22:53:38','[{\"id\": 420, \"nome\": \"Fritas Bonnie & Clyde\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,42,0,1,11,'',3.00,NULL),(375,'2019-09-06 22:58:06','[{\"id\": 423, \"nome\": \"Onion Ring\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,42,0,1,11,'',3.00,NULL),(376,'2019-09-06 23:04:07','[{\"id\": 419, \"nome\": \"Fora da Lei\", \"preco\": 45.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}, {\"id\": 422, \"nome\": \"Fritas Wanted\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',43.00,0,42,0,1,6,'',3.00,16),(377,'2019-09-06 23:21:50','[{\"id\": 416, \"nome\": \"Frank James\", \"preco\": 22.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 432, \"nome\": \"Jim Killer\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',14.60,0,42,0,1,11,'',3.00,16),(378,'2019-09-08 00:55:53','[{\"id\": 417, \"nome\": \"Belle Starr\", \"preco\": 25.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 427, \"nome\": \"Clay Alisson\", \"preco\": 7.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',35.00,0,41,0,1,4,'',3.00,NULL);
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
INSERT INTO `pedido_estado` VALUES (1,'INICIAL','Aguardando pagamento'),(2,'MEIO','Pagamento efetuado'),(3,'MEIO','Pagamento não efetuado'),(4,'MEIO','Aguardando confirmação'),(5,'MEIO','Pedido confirmado'),(6,'MEIO','Pedido não confirmado'),(7,'MEIO','Realizando estorno'),(8,'MEIO','Pedido em preparo'),(9,'MEIO','Esperando coleta'),(10,'MEIO','Saiu para entrega'),(11,'FINAL','Entregue');
/*!40000 ALTER TABLE `pedido_estado` ENABLE KEYS */;
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
-- Table structure for table `pre_pedido`
--

DROP TABLE IF EXISTS `pre_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_pedido` (
  `id_pre_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `data` timestamp NOT NULL,
  `itens` json NOT NULL,
  `precototal` decimal(8,2) NOT NULL,
  `id_formapagamento` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id_pre_pedido`),
  KEY `fk_pre_pedido_endereco1_idx` (`id_endereco`),
  KEY `fk_pre_pedido_formapagamento1_idx` (`id_formapagamento`),
  KEY `fk_pre_pedido_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_pre_pedido_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_pre_pedido_endereco1` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_pre_pedido_formapagamento1` FOREIGN KEY (`id_formapagamento`) REFERENCES `formapagamento` (`id_formapagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_pedido`
--

LOCK TABLES `pre_pedido` WRITE;
/*!40000 ALTER TABLE `pre_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_pedido` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (0,'','','C9AA599D2381C2539C2C072F62F54FD6',NULL,'CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','B234E2F6F50A442B85E5E64D8926E01669775A6C25DAA2EBFDCFEC70979D815D',0,0,'2019-01-22 23:05:09'),(46,'+5596991100443?12-08-2019 20:40','root','F7918F7099CBD12D367E1FFFF75518F1','DFC686',NULL,NULL,1,1,'2019-08-10 19:59:15'),(47,'+5596992055072','',NULL,'5073E7',NULL,NULL,0,0,'2019-08-10 21:00:33'),(48,'2','12345','E9F15E917835CB6CE280531305482B47','2D2838',NULL,NULL,1,1,'2019-08-11 02:47:28'),(49,'1','','96C41C7A65EB19D5D7990DF820281C26','C8D9C4',NULL,NULL,0,1,'2019-08-10 21:39:42'),(50,'+5596991126476','',NULL,'90DFED',NULL,NULL,0,0,'2019-08-10 23:11:02'),(51,'3','12345','A5AFCE46B2E3CD9909BBACD97CD4E018','6B4941',NULL,NULL,1,1,'2019-08-12 17:42:58'),(52,'4','12345','00A6676268F0C77FF2F1E668233D21B9','DDBD4F',NULL,NULL,1,1,'2019-08-12 18:17:41'),(53,'5','12345','D91CF695F525BCA4743A693A66C2A3EC','26FCB9',NULL,NULL,1,1,'2019-08-12 18:30:04'),(54,'+5591983517619?12-08-2019-20:44','12345','6938401DB50A6EE6F7303297E26FDDCA','7373D9',NULL,NULL,1,1,'2019-08-12 18:52:21'),(55,'+5596983517619','',NULL,'38CF8D',NULL,NULL,0,0,'2019-08-12 21:33:17'),(56,'+5591983517619?12-08-2019-21:55','gerico14599','25D5E1C685EDB9A2F379E18E78BE98A8','691AA0',NULL,NULL,1,1,'2019-08-12 21:34:12'),(57,'+5591983517619?13-08-2019-00:52','gerico14599','B18C9DA16BE9013F5C70F7C677008FDD','7F1AB2',NULL,NULL,1,1,'2019-08-12 22:52:02'),(58,'+5596981105390?13-08-2019-00:53','gerico14599','8311A1FFF9440386F2714A2143713138','888382',NULL,NULL,1,1,'2019-08-12 23:02:23'),(59,'+5591983517619?13-08-2019-01:32','gerico14599','8991AD4A7ED33C4C9FD53EB159C85CED','C8DDAE',NULL,NULL,1,1,'2019-08-13 00:54:54'),(60,'+5591983517619?13-08-2019-14:45','gerico14599','214CE3DB01552F93943C55B6AC8CEDFD','1E9B09',NULL,NULL,1,1,'2019-08-13 02:59:07'),(61,'+5591983517619?13-08-2019-20:16','12345','1A2CFFE90BEFE161471788E979DD01F3','E1B853',NULL,NULL,1,1,'2019-08-13 14:46:45'),(62,'+5596981212109?13-08-2019-20:16','12345678','E71AD125A7DEC2AAD55B07CB0348952F','6A0D45',NULL,NULL,1,1,'2019-08-13 17:03:57'),(63,'+5591983517619?13-08-2019-20:53','12345','E08B344B1907CC1BF372CE0489218C1E','D1C61B',NULL,NULL,1,1,'2019-08-13 20:17:23'),(64,'+5591983517619?26-08-2019-03:59','gerico14599','4D3A9774529CEACB0C8561225C6006CF','BA6785','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','B234E2F6F50A442B85E5E64D8926E01669775A6C25DAA2EBFDCFEC70979D815D',1,1,'2019-08-13 21:06:36'),(65,'+5596981243468?04-09-2019-17:58','12345678','C1E33E62B0925CB1E04551ECEE810D1D','FDACA9','C444E58543379A1470B912F98B20F361C47809237A4EC9951BFDB8C2CFC7A328','EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F',1,1,'2019-08-13 21:25:41'),(66,'+5596981165519','','FD6C9243172CE07FEDA5AA5316C5A8F0','0BED66',NULL,NULL,0,1,'2019-08-13 21:49:35'),(67,'+5591983517619?26-08-2019-13:39','12345','F25C5F17EEB1AB365B4B608133091C58','A634F4','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 13:31:24'),(68,'+5596991100443?26-08-2019-12:57','12345','98D9E74726073C68C93CD91926AEFE28','6A62DC','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 12:29:53'),(69,'+5596991100443?26-08-2019-13:08','12345678','7F37BF758CB1A076D3C999D973A1F55B','620E2D','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F',1,1,'2019-08-26 13:06:13'),(70,'+5596991100443?26-08-2019-13:25','12345','7F37BF758CB1A076D3C999D973A1F55B','0B9C48','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 13:10:03'),(71,'+5596991100443?02-09-2019-03:40','12345','EE45EDDE5B9F79A501B6507DC4FF9789','F095E3','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 13:27:48'),(72,'+5591983517619?26-08-2019-14:59','12345','3AA859255BDC2D271BB1BA53707D87F4','953FFF','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 13:39:39'),(73,'+5596991781167','12345','ACFA2C6EEA9E734F318695E007825958','10E264','E73FC72D67E23C793D1FC7B89FAC6460B2D36CA5574AE913E04D8CB68F7CEA89','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 15:01:15'),(74,'+5591983517619?03-09-2019-03:31','12345','D98132EFCDCED3A95CB9659FAC85CA8E','5E7B80','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5',1,1,'2019-08-26 15:59:41'),(75,'+5596991100443','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','784D985F9C579F77965EA8CDD9FAF0BC','B787FB','662C8EAFD8F35F0D9634FB4A6B4BB57B86AAB9AF41F2B9CDFB359A57715F7A06','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-09-02 03:41:20'),(76,'+5591983517619','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','D6B158621C2F22EA90E31F507EBB39C6','683FD9','CA9FE2597FC13DA6165B4EC82B1F5DA8794AEAF3141523E2AC1C515C95C165CA','6BAAD6F126FA53233F5120DD32225D4A9EEAEA26DCE58789F0B3B6EFCDB0DADB',1,1,'2019-09-03 03:32:01'),(77,'+5596981243468','',NULL,'55F93B',NULL,NULL,0,0,'2019-09-06 05:15:59');
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
INSERT INTO `usuario_admin` VALUES (1,'wantedadmin','ZXDas7966mby@','40AEAC1AB0B5D6C2C28DD5029E0CA9EB');
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
INSERT INTO `websocket` VALUES (0,NULL),(17,NULL),(18,'D871D9A751D4438CA12260D213527484'),(19,NULL),(20,NULL),(21,NULL),(22,'03D5293EE7F0BE9F441BB9C86C4A8F67'),(23,'EAD5E8059D72962179F8A1568911F011'),(24,NULL),(25,'F440A74B2779E6BCED7933D9AA0F93F9'),(26,'4CCADA71161316C3B874AC09FFC34BA7'),(27,NULL),(28,'1C442356568BB934A39575D90A5F505D'),(29,NULL),(30,NULL),(31,'7772AFA690F6E30F6AA4DC85CF8F58F7'),(32,NULL),(33,NULL),(34,NULL),(35,NULL),(36,NULL),(37,NULL),(38,'509EC83CF014EA9F9746C686A806EAB3'),(39,'A29A7C1E891EB17F62202978681FCC17'),(40,'5D0ADEF3A5E46D23965DFDFF84103EF2'),(41,'84A9F89F82B6310CE0CA5BA486DA7C09'),(42,'A40384BB34BB8144834824240096FDCE');
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
INSERT INTO `websocket_admin` VALUES (1,'ACCE17B43B86653E835624A6FAD7771E');
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

-- Dump completed on 2019-09-09  0:11:15

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (0,'','','','',0),(17,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',46),(18,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',48),(19,'argerio queiroz','02295260205','+5591983517619','argerioaf@gmail.com',51),(20,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',52),(21,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',53),(22,'argério','02295260205','+5591983517619','argerioaf@gmail.com',54),(23,'argério','02295260205','+5591983517619','argerioaf@gmail.com',56),(24,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',57),(25,'teste','02295260205','+5596981105390','argerioaf@gmail.com',58),(26,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',59),(27,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',60),(28,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',61),(29,'amon','02811511300','+5596981212109','Amon.ufc@gmail.com',62),(30,'Argério','02295260205','+5591983517619','argerioaf@gmail.com',63),(31,'Argerio','02295260205','+5591983517619','argerioaf@gmail.com',64),(32,'Renan Mescouto','02782267280','+5596981243468','renanmescouto123@gmail.com',65);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (0,0,'','','','','','','Buscar no local',0),(20,22,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(21,23,'Rua Euclides Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(22,25,'R. Euclídes Rodrigues','Central','De esquina com Av José de Anchieta','388','Santana','68925192','Minha casa',0),(23,26,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0),(24,28,'R. Pedro Siqueira Um','Universidade','Faculdade metq','180','Macapá','68925192','Faculdade',0),(25,31,'Rod. Duca Serra - Cabralzinho','Laguinho','Faculdade','55','Macapá','445555555','Argerio Queiroz',0),(26,31,'R. Euclídes Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa',0);
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
INSERT INTO `enderecos_favoritos` VALUES (17,0),(18,0),(19,0),(20,0),(21,0),(24,0),(27,0),(29,0),(30,0),(32,0),(22,20),(23,21),(25,22),(26,23),(28,24),(31,26);
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
  `descricao` varchar(45) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_formapagamento`),
  KEY `fk_formapagamento_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_formapagamento_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
INSERT INTO `formapagamento` VALUES (0,'A dinheiro',0),(1,'Paypal',0),(2,'Cartao Credito - PagSeguro',0);
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
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
INSERT INTO `item` VALUES (416,'Frank James','...',22.00,402,0,0,''),(417,'Belle Starr','...',25.00,402,0,0,''),(418,'Jim Killer','...',36.00,402,0,0,''),(419,'Fora da Lei','...',45.00,402,0,0,''),(420,'Fritas Bonnie & Clyde','...',5.00,403,0,0,''),(421,'Fritas Dupla','...',5.00,403,0,0,''),(422,'Fritas Wanted','...',5.00,403,0,0,''),(423,'Onion Ring','...',5.00,403,0,0,''),(424,'Wanted Ribs','...',5.00,403,0,0,''),(425,'Belle Starr','...',7.00,404,0,0,''),(426,'Billy the Kid','...',7.00,404,0,0,''),(427,'Clay Alisson','...',7.00,404,0,0,''),(428,'Dick Turpin','...',7.00,404,0,0,''),(429,'Frank James','...',7.00,404,0,0,''),(430,'Henri Starr','...',7.00,404,0,0,''),(431,'Jesse James','...',0.00,404,0,0,''),(432,'Jim Killer','...',7.00,404,0,0,''),(433,'John Wesley Hardin','...',7.00,404,0,0,''),(434,'Sam Bass','...',7.00,404,0,0,''),(435,'Wyatt Earp','...',8.00,404,0,0,''),(436,'Xerrif Willian J. Brady','...',10.00,404,0,0,''),(437,'Ben Thompson','...',15.00,405,0,0,''),(438,'Billy Mathews','...',12.00,405,0,0,''),(439,'Calamity Jane (Alcatra)','...',24.00,406,0,0,''),(440,'Pat Garret (Picanha)','...',35.00,406,0,0,''),(441,'Annie Oakley','...',14.00,407,0,0,''),(442,'Bucth Cassidy','...',7.00,407,0,0,''),(443,'John Dillinger','...',16.00,407,0,0,''),(444,'Tom Horn','...',15.50,407,0,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
INSERT INTO `notificacao` VALUES (1,31,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado_id\": 10, \"id_pedido\": 357, \"estado_controle\": \"MEIO\", \"estado_descricao\": \"Saiu para entrega\"}',0);
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
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_formapagamento1_idx` (`id_formapagamento`),
  KEY `fk_pedido_cliente1_idx` (`id_cliente`),
  KEY `fk_pedido_endereco1_idx` (`id_endereco`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_pedido_endereco1` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_pedido_formapagamento1` FOREIGN KEY (`id_formapagamento`) REFERENCES `formapagamento` (`id_formapagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (357,'2019-08-23 17:53:08','[{\"id\": 407, \"nome\": \"Belle Starr\", \"preco\": 5.0, \"variacoes\": [], \"precoTotal\": null, \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.00,0,31,0,1,10,'',3.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (0,'','',NULL,NULL,NULL,NULL,0,0,'2019-01-22 23:05:09'),(46,'+5596991100443?12-08-2019 20:40','root','F7918F7099CBD12D367E1FFFF75518F1','DFC686',NULL,NULL,1,1,'2019-08-10 19:59:15'),(47,'+5596992055072','',NULL,'5073E7',NULL,NULL,0,0,'2019-08-10 21:00:33'),(48,'2','12345','E9F15E917835CB6CE280531305482B47','2D2838',NULL,NULL,1,1,'2019-08-11 02:47:28'),(49,'1','','96C41C7A65EB19D5D7990DF820281C26','C8D9C4',NULL,NULL,0,1,'2019-08-10 21:39:42'),(50,'+5596991126476','',NULL,'90DFED',NULL,NULL,0,0,'2019-08-10 23:11:02'),(51,'3','12345','A5AFCE46B2E3CD9909BBACD97CD4E018','6B4941',NULL,NULL,1,1,'2019-08-12 17:42:58'),(52,'4','12345','00A6676268F0C77FF2F1E668233D21B9','DDBD4F',NULL,NULL,1,1,'2019-08-12 18:17:41'),(53,'5','12345','D91CF695F525BCA4743A693A66C2A3EC','26FCB9',NULL,NULL,1,1,'2019-08-12 18:30:04'),(54,'+5591983517619?12-08-2019-20:44','12345','6938401DB50A6EE6F7303297E26FDDCA','7373D9',NULL,NULL,1,1,'2019-08-12 18:52:21'),(55,'+5596983517619','',NULL,'38CF8D',NULL,NULL,0,0,'2019-08-12 21:33:17'),(56,'+5591983517619?12-08-2019-21:55','gerico14599','25D5E1C685EDB9A2F379E18E78BE98A8','691AA0',NULL,NULL,1,1,'2019-08-12 21:34:12'),(57,'+5591983517619?13-08-2019-00:52','gerico14599','B18C9DA16BE9013F5C70F7C677008FDD','7F1AB2',NULL,NULL,1,1,'2019-08-12 22:52:02'),(58,'+5596981105390?13-08-2019-00:53','gerico14599','8311A1FFF9440386F2714A2143713138','888382',NULL,NULL,1,1,'2019-08-12 23:02:23'),(59,'+5591983517619?13-08-2019-01:32','gerico14599','8991AD4A7ED33C4C9FD53EB159C85CED','C8DDAE',NULL,NULL,1,1,'2019-08-13 00:54:54'),(60,'+5591983517619?13-08-2019-14:45','gerico14599','214CE3DB01552F93943C55B6AC8CEDFD','1E9B09',NULL,NULL,1,1,'2019-08-13 02:59:07'),(61,'+5591983517619?13-08-2019-20:16','12345','1A2CFFE90BEFE161471788E979DD01F3','E1B853',NULL,NULL,1,1,'2019-08-13 14:46:45'),(62,'+5596981212109?13-08-2019-20:16','12345678','E71AD125A7DEC2AAD55B07CB0348952F','6A0D45',NULL,NULL,1,1,'2019-08-13 17:03:57'),(63,'+5591983517619?13-08-2019-20:53','12345','E08B344B1907CC1BF372CE0489218C1E','D1C61B',NULL,NULL,1,1,'2019-08-13 20:17:23'),(64,'+5591983517619','gerico14599','7BA571740ED0E8660434A82408B24F95','BA6785',NULL,NULL,1,1,'2019-08-13 21:06:36'),(65,'+5596981243468','12345678','D4AE22AD97EE80696D94D160D091C267','FDACA9',NULL,NULL,1,1,'2019-08-13 21:25:41'),(66,'+5596981165519','','FD6C9243172CE07FEDA5AA5316C5A8F0','0BED66',NULL,NULL,0,1,'2019-08-13 21:49:35');
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
INSERT INTO `usuario_admin` VALUES (1,'wantedadmin','ZXDas7966mby@','93CD8807A6F172FA506134044F8BB436');
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
INSERT INTO `websocket` VALUES (0,NULL),(17,NULL),(18,'D871D9A751D4438CA12260D213527484'),(19,NULL),(20,NULL),(21,NULL),(22,'03D5293EE7F0BE9F441BB9C86C4A8F67'),(23,'EAD5E8059D72962179F8A1568911F011'),(24,NULL),(25,'F440A74B2779E6BCED7933D9AA0F93F9'),(26,'4CCADA71161316C3B874AC09FFC34BA7'),(27,NULL),(28,'1C442356568BB934A39575D90A5F505D'),(29,NULL),(30,NULL),(31,'0704F6119D3C942B2ED7037F028DA4DC'),(32,NULL);
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
INSERT INTO `websocket_admin` VALUES (1,'93CD8807A6F172FA506134044F8BB436');
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

-- Dump completed on 2019-08-24 15:02:11

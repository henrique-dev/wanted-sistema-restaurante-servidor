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
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivo`
--

LOCK TABLES `arquivo` WRITE;
/*!40000 ALTER TABLE `arquivo` DISABLE KEYS */;
INSERT INTO `arquivo` VALUES (1,NULL),(2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,NULL),(11,NULL),(12,NULL),(13,NULL),(14,NULL),(15,NULL),(16,NULL),(17,NULL),(18,NULL),(19,NULL),(20,NULL),(21,NULL),(22,NULL),(23,NULL),(24,NULL),(25,NULL),(26,NULL),(27,NULL),(28,NULL),(29,NULL),(30,NULL),(31,NULL),(32,NULL),(33,NULL),(34,NULL),(35,NULL),(36,NULL),(37,NULL),(38,NULL),(39,NULL),(40,NULL),(41,NULL),(42,NULL),(43,NULL),(44,NULL),(45,NULL),(46,NULL),(47,NULL),(48,NULL),(49,NULL),(50,NULL),(51,NULL),(52,NULL),(53,NULL),(54,NULL),(55,NULL),(56,NULL),(57,NULL),(58,NULL),(59,NULL),(60,NULL),(61,NULL),(62,NULL),(63,NULL),(64,NULL),(65,NULL),(66,NULL),(67,NULL),(68,NULL),(69,NULL),(70,NULL),(71,NULL),(72,NULL),(73,NULL),(74,NULL),(75,NULL),(76,NULL),(77,NULL),(78,NULL),(79,NULL),(80,NULL),(81,NULL),(82,NULL),(83,NULL),(84,NULL),(85,NULL),(86,NULL),(87,NULL),(400,NULL),(401,NULL),(402,NULL),(403,NULL),(404,NULL),(405,NULL),(406,NULL),(407,NULL),(408,NULL),(409,NULL),(410,NULL),(411,NULL),(412,NULL),(413,NULL),(414,NULL),(415,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (0,'','','','',0),(17,'Paulo Henrique','01741053200','+5596991100443','henrique.phgb@gmail.com',46),(18,'argerio','02295260205','+5591983517619','argerioaf@gmail.com',48),(19,'argerio queiroz','02295260205','+5591983517619','argerioaf@gmail.com',51);
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
INSERT INTO `complemento` VALUES (1,'Pimenta',1.35,1),(2,'Maionese',3.60,2),(3,'Limão',3.90,3),(4,'Tomate',5.80,4),(5,'Arroz',7.90,5),(6,'Cebola frita',6.80,21),(7,'Ketchup',2.50,22),(8,'Morango',0.00,42),(9,'Maçã',0.00,43),(10,'Abacaxi',0.00,44),(11,'Laranja',0.00,45),(12,'Limão',3.50,84),(13,'Beterraba',3.50,85),(14,'Limão',10.50,86),(15,'Limãozinho',15.80,87),(400,'Teste',1.00,403),(401,'Abacate',0.00,415);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (0,0,'','','','','','','Buscar no local',0);
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
INSERT INTO `enderecos_favoritos` VALUES (17,0),(18,0),(19,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Bebidas'),(2,'Verdes'),(3,'Carnes'),(4,'Molhados'),(5,'Secos'),(6,'Doces'),(7,'Salgados'),(400,'Teste'),(401,'Teste2');
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
INSERT INTO `grupo_variacao` VALUES (1,'Tamanho',0,1,6),(2,'Sabor',1,3,6),(3,'Sabor',0,1,15),(400,'Tamanho',0,1,403),(401,'Sabores',1,1,403),(402,'Tamanho',0,1,404),(403,'Sabor',1,3,404),(404,'A',0,1,405);
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
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Vatapá','O melhor vatapá da região',12.30,7,1,0,'1 minuto'),(2,'Coca Cola','Coca cola bem geladinha',5.50,1,0,0,'1 minuto'),(3,'Pudim','Pudim bem gostosinho',5.80,6,0,0,'1 minuto'),(4,'Feijoada','Feijoada bem adubada',8.40,4,1,0,'1 minuto'),(5,'Fanta laranja 2L','Essa fanta é fanta',5.50,1,0,0,'1 minuto'),(6,'Pizza','Pizza itarriana',15.80,7,1,0,'1 minuto'),(7,'Espoca Bucho','Pra espocar o buchinho',3.50,1,0,0,'1 minuto'),(8,'Sushi','Variedade de sushis',16.80,5,1,0,'1 minuto'),(9,'Maniçoba','Maniçoba fresquinha e bem bonitinha',5.00,4,1,1,'1 minuto'),(10,'Peixe frito','Peixe gostosinho e bem fritinho',10.70,3,1,0,'1 minuto'),(11,'Galinha assada','Galinha caipira assada',15.00,3,0,0,'1 minuto'),(12,'Carne grelhada','Carne de boi bem grelhada. A melhor da região.',20.00,3,0,0,'1 minuto'),(13,'Porco assado de forno','Porquinho assadinho',18.00,3,0,0,'1 minuto'),(14,'Milkshake','Bem geladinho e cremosinho',10.00,1,0,0,'1 minuto'),(15,'Suco','Suco de varios sabores. Você pode tentar combinar.',7.00,1,0,0,'1 minuto'),(400,'Item teste','Este item é para testes',10.00,1,1,1,'1 minuto'),(401,'Item teste 2','Este item é para testes.',50.00,1,1,0,'1 minuto'),(402,'Item teste 3','Este item é para testes.',50.00,1,1,0,'1 minuto'),(403,'Item teste 4','Este é um item de testes',50.00,1,1,0,'1 minuto'),(404,'Item de teste 11','Novamente mais um item de teste',150.00,1,1,1,'1 minuto'),(405,'Item teste 12','Mais um item de testes',150.00,1,1,1,'1 minuto');
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
INSERT INTO `item_arquivo` VALUES (1,6),(1,7),(1,8),(2,9),(2,10),(3,12),(3,13),(4,14),(4,15),(4,16),(5,17),(6,18),(6,19),(7,20),(8,23),(8,24),(9,25),(9,26),(9,27),(10,28),(10,29),(11,30),(11,31),(11,32),(11,33),(12,34),(12,35),(12,36),(13,37),(13,38),(13,39),(14,40),(14,41),(15,46),(15,47),(15,48),(400,404),(400,405),(403,410),(403,411),(404,412),(404,413),(405,414);
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
INSERT INTO `item_complemento` VALUES (1,1),(4,1),(8,1),(9,1),(10,1),(404,1),(6,2),(8,2),(404,2),(405,2),(10,3),(404,3),(405,3),(4,4),(6,4),(10,4),(400,4),(404,4),(405,4),(1,5),(4,5),(8,5),(9,5),(10,5),(400,5),(403,5),(404,5),(405,5),(8,6),(9,6),(10,6),(400,6),(403,6),(404,6),(405,6),(8,7),(400,7),(403,7),(404,7),(405,7),(400,8),(403,8),(404,8),(405,8),(400,9),(403,9),(404,9),(405,9),(400,10),(404,10),(405,10),(404,11),(405,11),(404,12),(405,12),(404,13),(405,13),(404,14),(405,14),(404,15),(405,15),(404,400);
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
INSERT INTO `item_ingrediente` VALUES (9,1),(9,2),(9,3),(9,4),(9,5),(400,2),(400,3),(400,4),(404,2),(404,3),(404,4),(405,2),(405,3),(405,4),(405,5);
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
INSERT INTO `item_tipo` VALUES (1,1),(4,1),(9,1),(404,1),(1,2),(9,2),(401,2),(402,2),(403,2),(404,2),(405,2),(8,3),(400,3),(401,3),(402,3),(403,3),(404,3),(405,3),(2,4),(3,4),(5,4),(6,4),(7,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(400,4),(401,4),(402,4),(403,4),(405,4),(12,5),(13,5),(15,5),(400,5),(401,5),(402,5);
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
INSERT INTO `itens_favoritos` VALUES (18,3),(18,403);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
INSERT INTO `notificacao` VALUES (1,18,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado\": 4, \"id_pedido\": 341}',1),(2,18,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado\": 3, \"id_pedido\": 341}',1),(3,18,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado\": 3, \"id_pedido\": 341}',1),(4,18,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado\": 2, \"id_pedido\": 341}',1),(5,18,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado\": 3, \"id_pedido\": 341}',1),(6,18,'{\"id\": \"?\", \"tipo\": \"atualizacao_estado_pedido\", \"estado\": 4, \"id_pedido\": 341}',1);
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
  `estado` enum('1','2','3','4') NOT NULL,
  `observacao_entrega` varchar(150) DEFAULT NULL,
  `frete` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_formapagamento1_idx` (`id_formapagamento`),
  KEY `fk_pedido_cliente1_idx` (`id_cliente`),
  KEY `fk_pedido_endereco1_idx` (`id_endereco`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_pedido_endereco1` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_pedido_formapagamento1` FOREIGN KEY (`id_formapagamento`) REFERENCES `formapagamento` (`id_formapagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (341,'2019-08-11 12:09:46','[{\"id\": 9, \"nome\": \"Maniçoba\", \"preco\": 5.0, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [{\"id\": 6, \"nome\": \"Cebola frita\", \"preco\": 6.8}, {\"id\": 5, \"nome\": \"Arroz\", \"preco\": 7.9}, {\"id\": 1, \"nome\": \"Pimenta\", \"preco\": 1.35}], \"ingredientes\": [{\"id\": 1, \"nome\": \"Alface\", \"check\": true}, {\"id\": 2, \"nome\": \"Tomate\", \"check\": true}, {\"id\": 3, \"nome\": \"Cebola\", \"check\": true}, {\"id\": 4, \"nome\": \"Pepino\", \"check\": true}, {\"id\": 5, \"nome\": \"Cenoura\", \"check\": true}]}]',24.05,0,18,0,1,'4','',3.00);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
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
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `verificado` tinyint(1) DEFAULT '0',
  `token_cadastro_data` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (0,'','',NULL,NULL,0,0,'2019-01-22 23:05:09'),(46,'+5596991100443','root','17D053DB3417BFD77D86EEC1F10C23A1','DFC686',1,1,'2019-08-10 19:59:15'),(47,'+5596992055072','',NULL,'5073E7',0,0,'2019-08-10 21:00:33'),(48,'2','12345','E9F15E917835CB6CE280531305482B47','2D2838',1,1,'2019-08-11 02:47:28'),(49,'1','','96C41C7A65EB19D5D7990DF820281C26','C8D9C4',0,1,'2019-08-10 21:39:42'),(50,'+5596991126476','',NULL,'90DFED',0,0,'2019-08-10 23:11:02'),(51,'+5591983517619','12345','A5AFCE46B2E3CD9909BBACD97CD4E018','6B4941',1,1,'2019-08-12 17:42:58');
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
INSERT INTO `usuario_admin` VALUES (1,'wantedadmin','ZXDas7966mby@','17A5DAB6EFF4555B40730B9C428681CB');
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
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variacao`
--

LOCK TABLES `variacao` WRITE;
/*!40000 ALTER TABLE `variacao` DISABLE KEYS */;
INSERT INTO `variacao` VALUES (1,'Pequena',0.00,1,1),(2,'Média',5.00,2,1),(3,'Grande',10.00,3,1),(4,'Família',10.00,4,1),(5,'4 queijos',5.00,1,2),(6,'Calabresa',2.00,2,2),(7,'Frango',2.00,3,2),(8,'Frango com catupiri',5.00,4,2),(9,'Laranja',0.00,NULL,3),(10,'Maracujá',0.00,NULL,3),(11,'Abacate',0.00,NULL,3),(12,'Acerola',0.00,NULL,3),(13,'Tapereba',0.00,NULL,3),(14,'Uva',0.00,NULL,3),(15,'Graviola',0.00,NULL,3),(400,'A',0.00,1,400),(401,'C',0.00,1,401),(402,'A',0.00,1,402),(403,'B',5.00,2,402),(404,'C',10.00,3,402),(405,'D',15.00,4,402),(406,'E',20.00,5,402),(407,'A1',0.00,1,403),(408,'A2',0.00,2,403),(409,'A3',0.00,3,403),(410,'A4',0.00,4,403),(411,'A5',0.00,5,403),(412,'A',0.00,1,404),(413,'B',0.00,2,404),(414,'C',0.00,3,404),(415,'D',0.00,4,404);
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
INSERT INTO `websocket` VALUES (0,NULL),(17,NULL),(18,'D871D9A751D4438CA12260D213527484'),(19,NULL);
/*!40000 ALTER TABLE `websocket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-12 17:47:20

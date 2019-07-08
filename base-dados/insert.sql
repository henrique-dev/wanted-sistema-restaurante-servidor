-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: restaurante_wanted
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `arquivo`
--

LOCK TABLES `arquivo` WRITE;
/*!40000 ALTER TABLE `arquivo` DISABLE KEYS */;
INSERT INTO `arquivo` VALUES (1,NULL),(2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,NULL),(11,NULL),(12,NULL),(13,NULL),(14,NULL),(15,NULL),(16,NULL),(17,NULL),(18,NULL),(19,NULL),(20,NULL),(21,NULL),(22,NULL),(23,NULL),(24,NULL),(25,NULL),(26,NULL),(27,NULL),(28,NULL),(29,NULL),(30,NULL),(31,NULL),(32,NULL),(33,NULL),(34,NULL),(35,NULL),(36,NULL),(37,NULL),(38,NULL),(39,NULL),(40,NULL),(41,NULL),(42,NULL),(43,NULL),(44,NULL),(45,NULL),(46,NULL),(47,NULL),(48,NULL),(49,NULL),(50,NULL),(51,NULL),(52,NULL),(53,NULL),(54,NULL),(55,NULL),(56,NULL),(57,NULL),(58,NULL),(59,NULL),(60,NULL),(61,NULL),(62,NULL),(63,NULL),(64,NULL),(65,NULL),(66,NULL),(67,NULL),(68,NULL),(69,NULL),(70,NULL),(71,NULL),(72,NULL),(73,NULL),(74,NULL),(75,NULL),(76,NULL),(77,NULL),(78,NULL),(79,NULL),(80,NULL),(81,NULL),(82,NULL),(83,NULL),(84,NULL),(85,NULL),(86,NULL),(87,NULL),(400,NULL),(401,NULL),(402,NULL),(403,NULL),(404,NULL),(405,NULL),(406,NULL),(407,NULL),(408,NULL),(409,NULL),(410,NULL),(411,NULL),(412,NULL),(413,NULL),(414,NULL),(415,NULL);
/*!40000 ALTER TABLE `arquivo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER base_modificada_arquivo AFTER INSERT ON arquivo FOR EACH ROW
BEGIN
UPDATE restaurante set ultima_modificacao_itens = now() WHERE id_restaurante = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (0,'','','','',0),(10,'Paulo Henrique ','01741053200','96991100443','henrique.pbgb@gmail.com',29),(11,'Renan','02782267280','96981243468','pororoca@mrfood.com',30),(13,'Argério Queiroz','02295260205','96992055072','argerioaf@gmail.com',33),(14,'Argério','02295260205','91983517619','argerioaf@gmail.com',36);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `complemento`
--

LOCK TABLES `complemento` WRITE;
/*!40000 ALTER TABLE `complemento` DISABLE KEYS */;
INSERT INTO `complemento` VALUES (1,'Pimenta',1.35,1),(2,'Maionese',3.60,2),(3,'Limão',3.90,3),(4,'Tomate',5.80,4),(5,'Arroz',7.90,5),(6,'Cebola frita',6.80,21),(7,'Ketchup',2.50,22),(8,'Morango',0.00,42),(9,'Maçã',0.00,43),(10,'Abacaxi',0.00,44),(11,'Laranja',0.00,45),(12,'Limão',3.50,84),(13,'Beterraba',3.50,85),(14,'Limão',10.50,86),(15,'Limãozinho',15.80,87),(400,'Teste',1.00,403),(401,'Abacate',0.00,415);
/*!40000 ALTER TABLE `complemento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER base_modificada_complemento AFTER INSERT ON complemento FOR EACH ROW
BEGIN
UPDATE restaurante set ultima_modificacao_itens = now() WHERE id_restaurante = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (0,0,'','','','','','','Buscar no local'),(7,10,'Avenida Brasil (Lot F Deus)','Fonte Nova','Prox a um comercio','53','Santana','68928313','Minha casa'),(9,11,'Avenida Presidente Getúlio Vargas','Central','D','974','Macapá','68900070','Minha casa'),(14,13,'Rua Capitão Euclides Rodrigues','Central','De esquina','388','Santana','68925192','Minha casa'),(15,13,'Rua Capitão Euclides Rodrigues','Central','','388','Santana','68925192','Minha outra casa'),(16,13,'Rua Capitão Euclides Rodrigues','Central','sem complemento','XXX','Santana','68925192','My house'),(17,13,'Rua Capitão Euclides Rodrigues','Central','sem complemento','XXX','Santana','68925192','Casonq'),(18,14,'Rua Capitão Euclides Rodrigues','Central','sem complemento','388','Santana','68925192','Minha casa');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (253,259,0,0),(254,260,0,0),(255,261,0,0),(256,262,0,0),(257,263,0,0),(258,264,0,0),(259,265,0,0),(260,266,0,0),(261,267,0,0),(262,268,0,0),(263,269,0,0),(264,270,0,0),(265,271,0,0),(266,272,0,0),(267,273,0,0),(268,274,0,0),(269,275,0,0),(270,276,0,0),(271,277,0,0),(272,278,0,0),(273,279,0,0),(274,280,0,0),(275,281,0,0),(276,282,0,0),(277,283,0,0);
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
INSERT INTO `formapagamento` VALUES (0,'A dinheiro',0),(1,'Paypal',0),(2,'Cartao Credito - PagSeguro',0);
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Bebidas'),(2,'Verdes'),(3,'Carnes'),(4,'Molhados'),(5,'Secos'),(6,'Doces'),(7,'Salgados'),(400,'Teste'),(401,'Teste2');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER base_modificada_genero AFTER INSERT ON genero FOR EACH ROW
BEGIN
UPDATE restaurante set ultima_modificacao_itens = now() WHERE id_restaurante = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `grupo_variacao`
--

LOCK TABLES `grupo_variacao` WRITE;
/*!40000 ALTER TABLE `grupo_variacao` DISABLE KEYS */;
INSERT INTO `grupo_variacao` VALUES ('1','Tamanho',0,1,6),('2','Sabor',1,3,6),('3','Sabor',0,1,15),('400','Tamanho',0,1,403),('401','Sabores',1,1,403),('402','Tamanho',0,1,404),('403','Sabor',1,3,404),('404','A',0,1,405);
/*!40000 ALTER TABLE `grupo_variacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'Alface'),(2,'Tomate'),(3,'Cebola'),(4,'Pepino'),(5,'Cenoura'),(200,'Batata palha'),(201,'Cheiro verde'),(202,'Mastruz'),(203,'Leite'),(204,'Amendoim'),(205,'Alcaçus');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Vatapá','O melhor vatapá da região',12.30,7,1,0),(2,'Coca Cola','Coca cola bem geladinha',5.50,1,0,0),(3,'Pudim','Pudim bem gostosinho',5.80,6,0,0),(4,'Feijoada','Feijoada bem adubada',8.40,4,1,0),(5,'Fanta laranja 2L','Essa fanta é fanta',5.50,1,0,0),(6,'Pizza','Pizza itarriana',15.80,7,1,0),(7,'Espoca Bucho','Pra espocar o buchinho',3.50,1,0,0),(8,'Sushi','Variedade de sushis',16.80,5,1,0),(9,'Maniçoba','Maniçoba fresquinha e bem bonitinha',5.00,4,1,1),(10,'Peixe frito','Peixe gostosinho e bem fritinho',10.70,3,1,0),(11,'Galinha assada','Galinha caipira assada',15.00,3,0,0),(12,'Carne grelhada','Carne de boi bem grelhada. A melhor da região.',20.00,3,0,0),(13,'Porco assado de forno','Porquinho assadinho',18.00,3,0,0),(14,'Milkshake','Bem geladinho e cremosinho',10.00,1,0,0),(15,'Suco','Suco de varios sabores. Você pode tentar combinar.',7.00,1,0,0),(400,'Item teste','Este item é para testes',10.00,1,1,1),(401,'Item teste 2','Este item é para testes.',50.00,1,1,0),(402,'Item teste 3','Este item é para testes.',50.00,1,1,0),(403,'Item teste 4','Este é um item de testes',50.00,1,1,0),(404,'Item de teste 11','Novamente mais um item de teste',150.00,1,1,1),(405,'Item teste 12','Mais um item de testes',150.00,1,1,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER base_modificada_item AFTER INSERT ON item FOR EACH ROW
BEGIN
UPDATE restaurante set ultima_modificacao_itens = now() WHERE id_restaurante = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `item_arquivo`
--

LOCK TABLES `item_arquivo` WRITE;
/*!40000 ALTER TABLE `item_arquivo` DISABLE KEYS */;
INSERT INTO `item_arquivo` VALUES (1,6),(1,7),(1,8),(2,9),(2,10),(3,12),(3,13),(4,14),(4,15),(4,16),(5,17),(6,18),(6,19),(7,20),(8,23),(8,24),(9,25),(9,26),(9,27),(10,28),(10,29),(11,30),(11,31),(11,32),(11,33),(12,34),(12,35),(12,36),(13,37),(13,38),(13,39),(14,40),(14,41),(15,46),(15,47),(15,48),(400,404),(400,405),(403,410),(403,411),(404,412),(404,413),(405,414);
/*!40000 ALTER TABLE `item_arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item_complemento`
--

LOCK TABLES `item_complemento` WRITE;
/*!40000 ALTER TABLE `item_complemento` DISABLE KEYS */;
INSERT INTO `item_complemento` VALUES (1,1),(4,1),(8,1),(9,1),(10,1),(404,1),(6,2),(8,2),(404,2),(405,2),(10,3),(404,3),(405,3),(4,4),(6,4),(10,4),(400,4),(404,4),(405,4),(1,5),(4,5),(8,5),(9,5),(10,5),(400,5),(403,5),(404,5),(405,5),(8,6),(9,6),(10,6),(400,6),(403,6),(404,6),(405,6),(8,7),(400,7),(403,7),(404,7),(405,7),(400,8),(403,8),(404,8),(405,8),(400,9),(403,9),(404,9),(405,9),(400,10),(404,10),(405,10),(404,11),(405,11),(404,12),(405,12),(404,13),(405,13),(404,14),(405,14),(404,15),(405,15),(404,400);
/*!40000 ALTER TABLE `item_complemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item_ingrediente`
--

LOCK TABLES `item_ingrediente` WRITE;
/*!40000 ALTER TABLE `item_ingrediente` DISABLE KEYS */;
INSERT INTO `item_ingrediente` VALUES (9,1),(9,2),(9,3),(9,4),(9,5),(400,2),(400,3),(400,4),(404,2),(404,3),(404,4),(405,2),(405,3),(405,4),(405,5);
/*!40000 ALTER TABLE `item_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item_tipo`
--

LOCK TABLES `item_tipo` WRITE;
/*!40000 ALTER TABLE `item_tipo` DISABLE KEYS */;
INSERT INTO `item_tipo` VALUES (1,1),(4,1),(9,1),(404,1),(1,2),(9,2),(401,2),(402,2),(403,2),(404,2),(405,2),(8,3),(400,3),(401,3),(402,3),(403,3),(404,3),(405,3),(2,4),(3,4),(5,4),(6,4),(7,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(400,4),(401,4),(402,4),(403,4),(405,4),(12,5),(13,5),(15,5),(400,5),(401,5),(402,5);
/*!40000 ALTER TABLE `item_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (207,'2019-02-08 19:20:08','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.50,0,10,7,1,'1',''),(208,'2019-02-08 19:20:50','[{\"id\": 10, \"nome\": \"Peixe frito\", \"preco\": 10.7, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',13.70,2,10,7,1,'1',''),(209,'2019-02-08 19:21:59','[{\"id\": 4, \"nome\": \"Feijoada\", \"preco\": 8.4, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',11.40,1,10,7,1,'1',''),(212,'2019-02-08 19:30:01','[{\"id\": 7, \"nome\": \"Espoca Bucho\", \"preco\": 3.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',6.50,0,10,7,1,'1',''),(215,'2019-02-08 19:42:50','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": null}]',8.50,0,10,7,1,'1',NULL),(216,'2019-02-08 19:44:08','[{\"id\": 5, \"nome\": \"Fanta laranja 2L\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": null}]',8.50,2,10,7,1,'1',NULL),(229,'2019-02-09 15:23:28','[{\"id\": 1, \"nome\": \"Vatapá\", \"preco\": 12.3, \"variacoes\": [], \"quantidade\": 5, \"complementos\": [{\"id\": 1, \"nome\": \"Pimenta\", \"preco\": 1.35}, {\"id\": 5, \"nome\": \"Arroz\", \"preco\": 7.9}], \"ingredientes\": []}]',105.21,2,10,7,1,'1',''),(259,'2019-03-15 04:05:52','[{\"id\": 6, \"nome\": \"Pizza\", \"preco\": 15.8, \"variacoes\": [{\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 2, \"nome\": \"Média\", \"ordem\": 0, \"preco\": 5}]}, {\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 6, \"nome\": \"Calabresa\", \"ordem\": 0, \"preco\": 2}, {\"id\": 8, \"nome\": \"Frango com catupiri\", \"ordem\": 0, \"preco\": 5}]}], \"quantidade\": 1, \"complementos\": [{\"id\": 4, \"nome\": \"Tomate\", \"preco\": 5.8}, {\"id\": 2, \"nome\": \"Maionese\", \"preco\": 3.6}], \"ingredientes\": []}, {\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',43.42,0,13,14,1,'4','De esqui'),(260,'2019-03-15 04:05:52','[{\"id\": 9, \"nome\": \"Maniçoba\", \"preco\": 5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,13,15,1,'4',''),(261,'2019-03-15 03:58:22','[{\"id\": 15, \"nome\": \"Suco\", \"preco\": 7, \"variacoes\": [{\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 9, \"nome\": \"Laranja\", \"ordem\": 0, \"preco\": 0}]}], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',17.00,1,13,15,1,'1',''),(262,'2019-03-15 18:04:45','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.50,0,13,15,1,'1',''),(263,'2019-03-15 22:26:57','[{\"id\": 9, \"nome\": \"Maniçoba\", \"preco\": 5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,13,14,1,'1','Dddffx'),(264,'2019-03-16 03:55:58','[{\"id\": 9, \"nome\": \"Maniçoba\", \"preco\": 5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,13,16,1,'1',''),(265,'2019-03-16 04:07:54','[{\"id\": 9, \"nome\": \"Maniçoba\", \"preco\": 5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,13,16,1,'1','Ghjl bhhjh'),(266,'2019-03-16 05:37:01','[{\"id\": 9, \"nome\": \"Maniçoba\", \"preco\": 5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',13.00,0,13,14,1,'1',''),(267,'2019-03-16 06:13:22','[{\"id\": 9, \"nome\": \"Maniçoba\", \"preco\": 5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [{\"id\": 5, \"nome\": \"Arroz\", \"preco\": 7.9}, {\"id\": 1, \"nome\": \"Pimenta\", \"preco\": 1.35}, {\"id\": 6, \"nome\": \"Cebola frita\", \"preco\": 6.8}], \"ingredientes\": [{\"id\": 2, \"nome\": null, \"check\": true}, {\"id\": 4, \"nome\": null, \"check\": true}]}, {\"id\": 15, \"nome\": \"Suco\", \"preco\": 7, \"variacoes\": [{\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 9, \"nome\": \"Laranja\", \"ordem\": 0, \"preco\": 0}]}], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',29.50,1,13,16,1,'1','Casa de esquina, casa laranja, ponha bastante molho'),(268,'2019-03-16 06:16:26','[{\"id\": 1, \"nome\": \"Vatapá\", \"preco\": 12.3, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [{\"id\": 1, \"nome\": \"Pimenta\", \"preco\": 1.35}, {\"id\": 5, \"nome\": \"Arroz\", \"preco\": 7.9}], \"ingredientes\": []}, {\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',49.02,0,13,14,1,'1','Obs de teste, teste teste teste teste testar'),(269,'2019-03-16 19:19:14','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.50,0,11,9,1,'4','Hshdhf'),(270,'2019-03-21 19:56:48','[{\"id\": 6, \"nome\": \"Pizza\", \"preco\": 15.8, \"variacoes\": [{\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 2, \"nome\": \"Média\", \"ordem\": 0, \"preco\": 5}]}, {\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 6, \"nome\": \"Calabresa\", \"ordem\": 0, \"preco\": 2}, {\"id\": 8, \"nome\": \"Frango com catupiri\", \"ordem\": 0, \"preco\": 5}]}], \"quantidade\": 1, \"complementos\": [{\"id\": 2, \"nome\": \"Maionese\", \"preco\": 3.6}, {\"id\": 4, \"nome\": \"Tomate\", \"preco\": 5.8}], \"ingredientes\": []}, {\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',45.70,0,13,16,1,'1',''),(271,'2019-03-21 21:00:04','[{\"id\": 6, \"nome\": \"Pizza\", \"preco\": 15.8, \"variacoes\": [{\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 3, \"nome\": \"Grande\", \"ordem\": 0, \"preco\": 10}]}, {\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 7, \"nome\": \"Frango\", \"ordem\": 0, \"preco\": 2}]}], \"quantidade\": 1, \"complementos\": [{\"id\": 2, \"nome\": \"Maionese\", \"preco\": 3.6}, {\"id\": 4, \"nome\": \"Tomate\", \"preco\": 5.8}], \"ingredientes\": []}]',40.20,0,13,15,1,'1',''),(272,'2019-03-22 13:35:55','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 10, \"complementos\": [], \"ingredientes\": []}]',58.00,1,10,7,1,'1',''),(273,'2019-03-22 13:38:47','[{\"id\": 404, \"nome\": \"Item de teste 11\", \"preco\": 150, \"variacoes\": [{\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 406, \"nome\": \"E\", \"ordem\": 0, \"preco\": 20}]}, {\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 408, \"nome\": \"A2\", \"ordem\": 0, \"preco\": 0}, {\"id\": 409, \"nome\": \"A3\", \"ordem\": 0, \"preco\": 0}, {\"id\": 410, \"nome\": \"A4\", \"ordem\": 0, \"preco\": 0}]}], \"quantidade\": 10, \"complementos\": [{\"id\": 1, \"nome\": \"Pimenta\", \"preco\": 1.35}, {\"id\": 2, \"nome\": \"Maionese\", \"preco\": 3.6}, {\"id\": 8, \"nome\": \"Morango\", \"preco\": 0}, {\"id\": 12, \"nome\": \"Limão\", \"preco\": 3.5}, {\"id\": 10, \"nome\": \"Abacaxi\", \"preco\": 0}, {\"id\": 6, \"nome\": \"Cebola frita\", \"preco\": 6.8}, {\"id\": 400, \"nome\": \"Teste\", \"preco\": 1}, {\"id\": 14, \"nome\": \"Limão\", \"preco\": 10.5}, {\"id\": 4, \"nome\": \"Tomate\", \"preco\": 5.8}, {\"id\": 5, \"nome\": \"Arroz\", \"preco\": 7.9}, {\"id\": 13, \"nome\": \"Beterraba\", \"preco\": 3.5}, {\"id\": 3, \"nome\": \"Limão\", \"preco\": 3.9}, {\"id\": 7, \"nome\": \"Ketchup\", \"preco\": 2.5}, {\"id\": 11, \"nome\": \"Laranja\", \"preco\": 0}, {\"id\": 15, \"nome\": \"Limãozinho\", \"preco\": 15.8}, {\"id\": 9, \"nome\": \"Maçã\", \"preco\": 0}], \"ingredientes\": []}]',2364.50,1,10,7,1,'1',''),(274,'2019-03-25 01:22:57','[{\"id\": 6, \"nome\": \"Pizza\", \"preco\": 15.8, \"variacoes\": [{\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 2, \"nome\": \"Média\", \"ordem\": 0, \"preco\": 5}]}, {\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 6, \"nome\": \"Calabresa\", \"ordem\": 0, \"preco\": 2}, {\"id\": 8, \"nome\": \"Frango com catupiri\", \"ordem\": 0, \"preco\": 5}]}], \"quantidade\": 1, \"complementos\": [{\"id\": 2, \"nome\": \"Maionese\", \"preco\": 3.6}, {\"id\": 4, \"nome\": \"Tomate\", \"preco\": 5.8}], \"ingredientes\": []}, {\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',43.42,0,13,16,1,'1','Obs'),(275,'2019-03-25 01:50:02','[{\"id\": 9, \"nome\": \"Maniçoba\", \"preco\": 5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [{\"id\": 1, \"nome\": \"Pimenta\", \"preco\": 1.35}, {\"id\": 5, \"nome\": \"Arroz\", \"preco\": 7.9}], \"ingredientes\": [{\"id\": 4, \"nome\": null, \"check\": true}]}, {\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',40.38,0,13,14,1,'1','Observação'),(276,'2019-03-27 19:53:01','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',14.00,0,14,18,1,'1','Obs\n'),(277,'2019-03-28 22:50:55','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.50,0,14,18,1,'1','Top top '),(278,'2019-03-28 22:53:04','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}]',8.08,1,14,18,1,'1','Teste obs'),(279,'2019-03-28 22:56:31','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',14.00,1,14,18,1,'1','Djdjdj'),(280,'2019-03-28 23:04:59','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',14.00,1,14,18,1,'1','Obs fggg'),(281,'2019-03-28 23:06:27','[{\"id\": 12, \"nome\": \"Carne grelhada\", \"preco\": 20, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',43.00,1,14,18,1,'1','Obs'),(282,'2019-04-26 22:56:30','[{\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [], \"ingredientes\": []}, {\"id\": 9, \"nome\": \"Maniçoba\", \"preco\": 5, \"variacoes\": [], \"quantidade\": 1, \"complementos\": [{\"id\": 1, \"nome\": \"Pimenta\", \"preco\": 1.35}, {\"id\": 5, \"nome\": \"Arroz\", \"preco\": 7.9}], \"ingredientes\": []}]',21.61,0,14,18,1,'1','Obs '),(283,'2019-04-26 23:27:17','[{\"id\": 6, \"nome\": \"Pizza\", \"preco\": 15.8, \"variacoes\": [{\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 3, \"nome\": \"Grande\", \"ordem\": 0, \"preco\": 10}]}, {\"max\": 0, \"nome\": null, \"variacoes\": [{\"id\": 6, \"nome\": \"Calabresa\", \"ordem\": 0, \"preco\": 2}, {\"id\": 7, \"nome\": \"Frango\", \"ordem\": 0, \"preco\": 2}, {\"id\": 8, \"nome\": \"Frango com catupiri\", \"ordem\": 0, \"preco\": 5}]}], \"quantidade\": 1, \"complementos\": [{\"id\": 2, \"nome\": \"Maionese\", \"preco\": 3.6}, {\"id\": 4, \"nome\": \"Tomate\", \"preco\": 5.8}], \"ingredientes\": []}, {\"id\": 2, \"nome\": \"Coca Cola\", \"preco\": 5.5, \"variacoes\": [], \"quantidade\": 2, \"complementos\": [], \"ingredientes\": []}]',55.29,1,13,15,1,'1','Ketchup e maionese');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER inserir_entrega AFTER INSERT ON pedido FOR EACH ROW
BEGIN
CALL utils_alocar_index_entrega(true, @index_atual);
INSERT INTO entrega VALUES (@index_atual, new.id_pedido, false, false);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `pre_pedido`
--

LOCK TABLES `pre_pedido` WRITE;
/*!40000 ALTER TABLE `pre_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `restaurante`
--

LOCK TABLES `restaurante` WRITE;
/*!40000 ALTER TABLE `restaurante` DISABLE KEYS */;
INSERT INTO `restaurante` VALUES (1,'MRFOOD','AVENIDA 32','2019-01-23 21:43:52');
/*!40000 ALTER TABLE `restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Típicas'),(2,'Regionais'),(3,'Japonesa'),(4,'Tradicional'),(5,'Especialidade'),(400,'A'),(401,'B'),(402,'c'),(403,'D'),(404,'E'),(405,'F'),(406,'G'),(407,'A21'),(408,'a22'),(409,'a23'),(410,'124');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER base_modificada_tipo AFTER INSERT ON tipo FOR EACH ROW
BEGIN
UPDATE restaurante set ultima_modificacao_itens = now() WHERE id_restaurante = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (0,'','',NULL,NULL,0,0,NULL,'2019-01-22 23:05:09'),(29,'96991100443','root','C6727E749F0D5D1A0AC695975194512C','E1ABEC',1,1,NULL,'2019-07-05 16:48:54'),(30,'96981243468','12345678','AB54DD39D4E58E57A644E7BC5F098B52','104509',1,1,'408D28BBDFFC080A2803733CA7DF62F9','2019-05-09 20:54:33'),(31,'96991126476','',NULL,'89FE1B',0,0,NULL,'2019-01-22 23:05:09'),(33,'96992055072','12345','0303B77D69EE71B10AD3D3D4CDC8E927','7ECFEF',1,1,NULL,'2019-07-05 17:54:21'),(34,'96991781167','',NULL,'EAA47D',0,0,NULL,'2019-03-09 22:21:47'),(35,'96999099674','',NULL,'71B0E3',0,0,NULL,'2019-03-16 19:07:41'),(36,'91983517619','12345',NULL,'1D01E3',1,1,NULL,'2019-04-26 22:56:42'),(37,'96992055073','',NULL,'BC5F64',0,0,NULL,'2019-07-05 03:21:11'),(38,'96992055074','',NULL,'1C63DC',0,0,NULL,'2019-07-05 03:28:54');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `variacao`
--

LOCK TABLES `variacao` WRITE;
/*!40000 ALTER TABLE `variacao` DISABLE KEYS */;
INSERT INTO `variacao` VALUES (1,'Pequena',0.00,1,'1'),(2,'Média',5.00,2,'1'),(3,'Grande',10.00,3,'1'),(4,'Família',10.00,4,'1'),(5,'4 queijos',5.00,1,'2'),(6,'Calabresa',2.00,2,'2'),(7,'Frango',2.00,3,'2'),(8,'Frango com catupiri',5.00,4,'2'),(9,'Laranja',0.00,NULL,'3'),(10,'Maracujá',0.00,NULL,'3'),(11,'Abacate',0.00,NULL,'3'),(12,'Acerola',0.00,NULL,'3'),(13,'Tapereba',0.00,NULL,'3'),(14,'Uva',0.00,NULL,'3'),(15,'Graviola',0.00,NULL,'3'),(400,'A',0.00,1,'400'),(401,'C',0.00,1,'401'),(402,'A',0.00,1,'402'),(403,'B',5.00,2,'402'),(404,'C',10.00,3,'402'),(405,'D',15.00,4,'402'),(406,'E',20.00,5,'402'),(407,'A1',0.00,1,'403'),(408,'A2',0.00,2,'403'),(409,'A3',0.00,3,'403'),(410,'A4',0.00,4,'403'),(411,'A5',0.00,5,'403'),(412,'A',0.00,1,'404'),(413,'B',0.00,2,'404'),(414,'C',0.00,3,'404'),(415,'D',0.00,4,'404');
/*!40000 ALTER TABLE `variacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-07 21:22:38

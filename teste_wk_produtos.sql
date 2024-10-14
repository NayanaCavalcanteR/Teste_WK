-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: teste_wk
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) NOT NULL,
  `preco_venda` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `idx_descricao_produtos` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Absorvente com abas diurno c/ 32',15.50),(2,'Absorvente com abas noturno c/ 32',21.45),(3,'Protetor diário c/ 40',11.99),(4,'Pasta dental sensitive sensodyne 90g',11.35),(5,'Pasta dental sorriso 180g',7.99),(6,'Escova dental soft',20.00),(7,'Sabonete liquido rexona',12.56),(8,'Sabonete em barra rexona',2.39),(9,'Sabonete em barra glicerina Granado',4.50),(10,'Desodorante dove men invisible',18.50),(11,'Desodorante dove women invisible',18.50),(12,'Desodorante monagen invisible',11.30),(13,'Hidratante corporal nivea',22.54),(14,'Hidratante corporal Cerave',70.00),(15,'Hidratante mãos Cerave',56.50),(16,'Hidratante pés Cerave',62.32),(17,'Tylenol cartela c/ 4 comprimidos',9.00),(18,'Tylenol caixa',15.00),(19,'Cotonetes c/ 50',7.34),(20,'Cotonetes c/ 200',18.50);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14 13:04:56

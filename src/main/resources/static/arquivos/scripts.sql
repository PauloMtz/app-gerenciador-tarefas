-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: gerenciador_tarefas
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(60) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'Belo Horizonte','MG'),(2,'São Paulo','SP'),(3,'Campinas','SP'),(4,'Vitória','ES'),(5,'Londrina','PR'),(6,'Curitiba','PR'),(7,'Rio Claro','SP'),(8,'Uberlândia','MG'),(9,'Rio de Janeiro','RJ');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'USER'),(2,'ADMIN');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoria` enum('JARDINAGEM','LIMPEZA','MANUT_PREDIAL','RESERVAS') NOT NULL,
  `concluida` bit(1) NOT NULL,
  `data_conclusao` datetime(6) DEFAULT NULL,
  `data_criacao` datetime(6) NOT NULL,
  `data_expiracao` datetime(6) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2vwr1gcbcpkerkhk9ktxxbep` (`usuario_id`),
  CONSTRAINT `FK2vwr1gcbcpkerkhk9ktxxbep` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,'MANUT_PREDIAL',_binary '','2025-02-15 16:44:12.000000','2025-02-15 16:31:33.000000','2025-02-18 16:31:33.000000','Porta do salão está empenada, não fecha totalmente','Manutenção na porta do salão de festas',2),(2,'JARDINAGEM',_binary '\0',NULL,'2025-02-15 16:31:33.000000','2025-02-19 16:31:33.000000','A grama está muito alta e com muito mato. Favor aparar.','Aparar a grama do jardim da área centrar',3),(3,'RESERVAS',_binary '','2025-02-15 16:35:12.000000','2025-02-15 16:31:33.000000','2025-02-17 16:31:33.000000','Solicito reserva do salão de festas para o próximo final de semana','Reserva do são de festas',4),(4,'LIMPEZA',_binary '\0',NULL,'2025-02-15 16:31:33.000000','2025-02-18 16:31:33.000000','Solicito limpeza do salão de festas para a próxima sexta-feira','Limpeza do são de festas',4),(5,'MANUT_PREDIAL',_binary '\0',NULL,'2025-02-15 16:31:33.000000','2025-02-16 16:31:33.000000','Porta do elevador não fecha totalmente','Manutenção na porta do elevador',5),(6,'MANUT_PREDIAL',_binary '','2025-02-15 16:34:52.000000','2025-02-15 16:31:33.000000','2025-02-18 16:31:33.000000','Fazer a manutenção preventiva na bomba da torre de água','Manutenção preventiva na bomba de água',4),(7,'LIMPEZA',_binary '\0',NULL,'2025-02-15 16:31:33.000000','2025-02-17 16:31:33.000000','Efetuar a limpeza do bloco 07 na próxima semana','Limpeza do bloco 7',13),(8,'MANUT_PREDIAL',_binary '\0',NULL,'2025-02-15 16:31:33.000000','2025-02-19 16:31:33.000000','Efetuar manutenção corretiva no portão de entrada porque o mesmo está travando','Manutenção no portão de entrada',11),(9,'RESERVAS',_binary '\0',NULL,'2025-02-15 16:31:33.000000','2025-02-17 16:31:33.000000','Solicito reservar o salão de festas para o próximo feriado','Reserva do salão de festas',9),(10,'JARDINAGEM',_binary '\0',NULL,'2025-02-15 16:31:34.000000','2025-02-16 16:31:34.000000','Solicitamos efetuar a poda das árvores no canteiro central da rua do condomínio','Poda de árvores na rua do condomínio',7),(11,'MANUT_PREDIAL',_binary '\0',NULL,'2025-02-15 16:31:34.000000','2025-02-18 16:31:34.000000','Verificar o telhado do bloco 4 porque está apresentando vazamentos nos dias de chuva','Verificar telhado do bloco 4',4),(12,'RESERVAS',_binary '','2025-02-15 16:38:42.000000','2025-02-15 16:31:34.000000','2025-02-16 16:31:34.000000','Solicito reserva do salão de festas para o feriado do mês que vem, inclusive o prolongamento para o ','Reserva do salão de festas no feriado do mês que vem',8),(13,'MANUT_PREDIAL',_binary '\0',NULL,'2025-02-15 16:31:34.000000','2025-02-16 16:31:34.000000','Favor averificar a porta de vidro da entrada principal do bloco 8. A mesma parece estar travando.','Verificar a porta da entrada principal do bloco 8',2),(14,'JARDINAGEM',_binary '','2025-02-15 16:40:17.000000','2025-02-15 16:31:34.000000','2025-02-17 16:31:34.000000','Favor efetuar a poda do gramado dos fundos porque o gramado está muito alto','Aparar a grama no fundo do condomínio',10),(15,'LIMPEZA',_binary '\0',NULL,'2025-02-15 16:31:34.000000','2025-02-17 16:31:34.000000','Solicito efetuar a limpeza do bloco 5 nos próximos dias porque o mesmo está apresentando a necessida','Limpeza do bloco 5 nos próximos dias',6),(16,'MANUT_PREDIAL',_binary '','2025-02-15 16:41:29.000000','2025-02-15 16:31:34.000000','2025-02-18 16:31:34.000000','Porta do elevador do bloco 2 não fecha totalmente','Manutenção na porta do elevador do bloco 2',12),(17,'LIMPEZA',_binary '\0',NULL,'2025-02-15 16:31:34.000000','2025-02-16 16:31:34.000000','Favor efetuar a limpeza do ambiente de dispensa do lixo','Limpeza no local de dispensa do lixo',5),(18,'RESERVAS',_binary '','2025-02-15 16:42:32.000000','2025-02-15 16:31:34.000000','2025-02-18 16:31:34.000000','Solicito reserva do salão de festas para o segundo final de semana do mês que vem','Reserva do salão de festas',7),(19,'MANUT_PREDIAL',_binary '','2025-02-15 16:45:13.000000','2025-02-15 16:31:34.000000','2025-02-18 16:31:34.000000','Favor verificar as janelas do lado do fundo do bloco 8 porque tem algumas com vidros quebrados','Verificar janelas dos fundos do bloco 8',9),(20,'LIMPEZA',_binary '\0',NULL,'2025-02-15 16:31:34.000000','2025-02-19 16:31:34.000000','Solicito limpeza da vala de escoamento da água de chuva na rua do condomínio na altura do bloco 3','Limpeza da vala de escoamento da água de chuva',13),(21,'JARDINAGEM',_binary '\0',NULL,'2025-02-15 16:31:34.000000','2025-02-17 16:31:34.000000','Efetuar a poda dos galhos das árvores na rua do condomínio que estão caindo em cima dos carros que p','Poda dos galhos das árvores na rua do condomínio',5),(22,'MANUT_PREDIAL',_binary '','2025-02-15 16:42:26.000000','2025-02-15 16:31:34.000000','2025-02-16 16:31:34.000000','Verificar as lâmpada do salão de festas porque algumas delas estão apresentando instabilidade.','Verificar as lâmpadas do salão de festas',7),(23,'MANUT_PREDIAL',_binary '\0',NULL,'2025-02-15 16:31:36.000000','2025-02-17 16:31:36.000000','Verificar a porta do elevador do bloco 1 porque a mesma não fecha totalmente','Manutenção na porta do elevador do bloco 1',12);
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_perfil`
--

DROP TABLE IF EXISTS `usuario_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_perfil` (
  `usuario_id` bigint(20) NOT NULL,
  `perfil_id` bigint(20) NOT NULL,
  KEY `FK22cgfn0obntlvqyfn33pyk24d` (`perfil_id`),
  KEY `FK46v67aocrgergt30mf76suhgm` (`usuario_id`),
  CONSTRAINT `FK22cgfn0obntlvqyfn33pyk24d` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`),
  CONSTRAINT `FK46v67aocrgergt30mf76suhgm` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_perfil`
--

LOCK TABLES `usuario_perfil` WRITE;
/*!40000 ALTER TABLE `usuario_perfil` DISABLE KEYS */;
INSERT INTO `usuario_perfil` VALUES (1,2),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1);
/*!40000 ALTER TABLE `usuario_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) NOT NULL,
  `data_atualizacao` datetime(6) DEFAULT NULL,
  `data_cadastro` datetime(6) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `localidade_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKibif7d2iwk1451xly7sewmxaj` (`localidade_id`),
  CONSTRAINT `FKibif7d2iwk1451xly7sewmxaj` FOREIGN KEY (`localidade_id`) REFERENCES `localidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,_binary '',NULL,'2025-02-15 16:31:31.000000','jose.teste@email.com','José Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',3),(2,_binary '',NULL,'2025-02-15 16:31:31.000000','lorena.silva@email.com','Lorena Silva','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',7),(3,_binary '',NULL,'2025-02-15 16:31:31.000000','maria.rita@email.com','Maria Rita','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',4),(4,_binary '',NULL,'2025-02-15 16:31:32.000000','ribamar.teste@email.com','Ribamar Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',8),(5,_binary '',NULL,'2025-02-15 16:31:32.000000','ana.beatriz@email.com','Ana Beatriz','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',5),(6,_binary '',NULL,'2025-02-15 16:31:32.000000','fernanda.beatriz@email.com','Fernanda Beatriz','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',1),(7,_binary '',NULL,'2025-02-15 16:31:32.000000','marcio.silva@email.com','Márcio Silva','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',9),(8,_binary '',NULL,'2025-02-15 16:31:32.000000','teobaldo.silva@email.com','Teobaldo Silva','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',2),(9,_binary '',NULL,'2025-02-15 16:31:32.000000','sebastiao.teste@email.com','Sebastião Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',6),(10,_binary '',NULL,'2025-02-15 16:31:32.000000','maria.carla@email.com','Maria Carla','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',3),(11,_binary '',NULL,'2025-02-15 16:31:32.000000','alberto.teste@email.com','Alberto Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',9),(12,_binary '',NULL,'2025-02-15 16:31:32.000000','edmar.teste@email.com','Edmar Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',2),(13,_binary '',NULL,'2025-02-15 16:31:32.000000','thaissa.teste@email.com','Thaíssa Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',5);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-15 16:47:07

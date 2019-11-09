-- MySQL dump 10.13  Distrib 5.5.61, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fj27_spring
-- ------------------------------------------------------
-- Server version	5.5.61-0ubuntu0.14.04.1

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic_id` bigint(20) DEFAULT NULL,
  `content` longtext,
  `solution` bit(1) NOT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgew5a7jo3778hfx2kmdy78826` (`topic_id`),
  KEY `FKcyrci55q6yjwtm4qnojsjep5e` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKap0cnk1255oj4bwam7in1hxxv` (`category_id`),
  CONSTRAINT `FKap0cnk1255oj4bwam7in1hxxv` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Programação',NULL),(2,'Java',1),(3,'Design',NULL),(4,'Web Design',3),(5,'Mobile',NULL),(6,'Front-end',NULL),(7,'Infraestrutura',NULL),(8,'Business',NULL),(9,'Lógica de Programação',1),(10,'C#',1),(11,'Ruby',1),(12,'Java para Web',1),(13,'.NET para Web',1),(14,'Ruby on Rails',1),(15,'Integrações em Java',1),(16,'Integrações em .NET',1),(17,'Testes em Java',1),(18,'Testes em C#',1),(19,'Boas Práticas em Java',1),(20,'Boas Práticas em C#',1),(21,'Certificação Java',1),(22,'Persistência com Java',1),(23,'Programação Funcional',1),(24,'Linguagem C',1),(25,'Computação',1),(26,'Persistência com .NET',1),(27,'Desenvolvimento de Jogos',1),(28,'Análise de Dados',1),(29,'iOS',5),(30,'Android',5),(31,'Multiplataforma',5),(32,'Jogos',5),(33,'Introdução ao Design',3),(34,'Impressos',3),(35,'Vídeo e Motion',3),(36,'3D',3),(37,'Fotografia',3),(38,'UX',3),(39,'Apresentações',3),(40,'HTML e CSS',6),(41,'jQuery',6),(42,'JavaScript',6),(43,'Frameworks MVC',6),(44,'Automação e Performance',6),(45,'SQL',7),(46,'NoSQL',7),(47,'Linux',7),(48,'Builds e Versionamento',7),(49,'Entrega Contínua',7),(50,'Windows',7),(51,'Redes',7),(52,'Internet das Coisas',7),(53,'Embarcados',7),(54,'Cloud Computing',7),(55,'CCNA exame 100-105',7),(56,'Marketing Digital',8),(57,'Excel',8),(58,'Agilidade',8),(59,'SEO e Adwords',8),(60,'Documentação',8),(61,'Concursos',8),(62,'Carreira',8),(63,'Governança',8),(64,'Social Media',8),(65,'Construção de Sites',8),(66,'Startup',8),(67,'E-commerce',8),(68,'Liderança',8),(69,'Business Intelligence',8);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subcategory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcv8y885pfc065dxxivrcrx42a` (`subcategory_id`),
  CONSTRAINT `FKcv8y885pfc065dxxivrcrx42a` FOREIGN KEY (`subcategory_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Java e Orientação a Objetos',2),(2,'Adobe XD',4),(3,'Bootstrap',40),(4,'React Native parte 2',31),(5,'MySQL I',45),(6,'Scrum',58);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_topics_by_category`
--

DROP TABLE IF EXISTS `open_topics_by_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_topics_by_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `topic_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_topics_by_category`
--

LOCK TABLES `open_topics_by_category` WRITE;
/*!40000 ALTER TABLE `open_topics_by_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_topics_by_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY (`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('ROLE_ADMIN'),('ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_instant` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `FKtktaeeogyyjfv5ylr4r06ig1l` (`course_id`),
  KEY `FKq4081wq6xb84qd781jkac17sv` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'2018-07-20 17:23:17','2018-07-20 17:23:17','Como mapear uma Servlet',1,1,'NOT_SOLVED',NULL),(2,'2018-07-21 16:19:41','2018-07-21 16:19:41','Duvida sobre Polimorfismo',1,1,'NOT_ANSWERED',NULL),(3,'2018-07-22 17:05:28','2018-07-22 17:05:28','O que faremos neste curso?',2,1,'NOT_ANSWERED',NULL),(4,'2018-07-23 18:23:31','2018-07-23 18:23:31','JSP não funciona',1,1,'NOT_ANSWERED',NULL),(5,'2018-07-24 18:23:56','2018-07-24 18:23:56','Como o Spring injeta as coisa tudo',1,1,'NOT_ANSWERED',NULL),(6,'2018-07-25 18:24:29','2018-07-25 18:24:29','Spring Boot é bom mesmo?',1,1,'NOT_ANSWERED',NULL),(7,'2018-07-26 18:25:44','2018-07-26 18:25:44','Não tenho bom gosto, conseguirei ser um bom designer?',2,1,'NOT_ANSWERED',NULL),(8,'2018-07-27 18:26:44','2018-07-27 18:26:44','Quais as competencias de um bom UXzeiro?',2,1,'NOT_ANSWERED',NULL),(9,'2018-07-28 18:27:16','2018-07-28 18:27:16','Photoshop não está tendo um bom relacionamento comigo!',2,1,'NOT_ANSWERED',NULL),(10,'2018-07-29 18:27:16','2018-07-29 18:27:16','Por que não fazemos new para criar Strings',1,2,'NOT_ANSWERED',NULL),(11,'2018-07-30 18:26:19','2018-07-30 18:26:19','Por que Magenta não combina com Verde Limão?',2,2,'NOT_ANSWERED',NULL),(12,'2018-08-01 18:27:16','2018-08-01 18:27:16','Grid com comportamento estranho',3,2,'NOT_ANSWERED',NULL),(13,'2018-08-02 18:27:16','2018-08-02 18:27:16','Erro ao rodar emulador Android',4,2,'NOT_ANSWERED',NULL),(14,'2018-08-03 18:27:16','2018-08-03 18:27:16','Problema com subqueries',5,2,'NOT_ANSWERED',NULL),(15,'2018-08-04 18:27:16','2018-08-04 18:27:16','Não entendi muito bem a função do Scrum Master',6,2,'NOT_ANSWERED',NULL),(16,'2018-08-05 19:27:16','2018-08-05 19:27:16','Não entendi o Design Pattern Decorator',1,2,'NOT_SOLVED',NULL),(17,'2018-08-06 20:26:19','2018-08-06 20:26:19','Como trocar fundo de imagem do Photoshop?',2,2,'NOT_SOLVED',NULL),(18,'2018-08-07 21:27:16','2018-08-07 21:27:16','Problemas ao usar os alerts do Bootstrap',3,2,'NOT_SOLVED',NULL),(19,'2018-08-08 22:27:16','2018-08-08 22:27:16','Erro ao rodar o comando react-native start',4,2,'NOT_SOLVED',NULL),(20,'2018-08-09 23:27:16','2018-08-09 23:27:16','Como fazer essa agregação?',5,2,'NOT_SOLVED',NULL),(21,'2018-08-10 00:27:16','2018-08-10 00:27:16','Qual tempo ideal de uma sprint?',6,2,'NOT_SOLVED',NULL),(22,'2018-08-11 18:27:16','2018-08-11 18:27:16','Quando usar classes abstratas?',1,3,'NOT_ANSWERED',NULL),(23,'2018-08-12 18:26:19','2018-08-12 18:26:19','Dica de paleta de cores para aplicação de restaurante!',2,3,'NOT_ANSWERED',NULL),(24,'2018-08-13 18:27:16','2018-08-13 18:27:16','Problemas ao implementar carrousel!',3,3,'NOT_ANSWERED',NULL),(25,'2018-08-14 18:27:16','2018-08-14 18:27:16','Como estilizar componentes <Text> internos',4,3,'NOT_ANSWERED',NULL),(26,'2018-08-15 18:27:16','2018-08-15 18:27:16','Erro ao executar statement',5,3,'NOT_ANSWERED',NULL),(27,'2018-08-16 18:27:16','2018-08-16 18:27:16','Como melhorar a eficiencia das minhas reuniões diárias?',6,3,'NOT_ANSWERED',NULL),(28,'2018-08-17 19:27:16','2018-08-17 19:27:16','Como ler arquivo csv com java.io?',1,3,'NOT_SOLVED',NULL),(29,'2018-08-18 20:26:19','2018-08-18 20:26:19','Ferramentas para auxiliar testes de usabilidade?',2,3,'NOT_SOLVED',NULL),(30,'2018-08-19 21:27:16','2018-08-19 21:27:16','Como posso personalizar o bootstrap?',3,3,'NOT_SOLVED',NULL),(31,'2018-08-20 22:27:16','2018-08-20 22:27:16','Problemas ao executar react-native run-ios',4,3,'NOT_SOLVED',NULL),(32,'2018-08-21 23:27:16','2018-08-21 23:27:16','Problema ao executar procedure!',5,3,'NOT_SOLVED',NULL),(33,'2018-08-22 00:27:16','2018-08-22 00:27:16','Qual melhor dinâmica para a minha retro?',6,3,'NOT_SOLVED',NULL);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'rafael.rollo@caelum.com.br','Rafael Rollo','$2a$10$7YR8zuQ8CIYvLXkw4gJr4OgtQuAbBzFKEv8xaYqjA/Wf7RtrGSkF6'),(2,'thais.andre@caelum.com.br','Thais André','$2a$10$N3ho7x60pv/KyvLlQub2se8ia4b8FIRklXQHkl70R2yvk8///odj.'),(3,'alberto.souza@caelum.com.br','Alberto Souza','$2a$10$WMnse4qHoHF3MNAmL2yxtOb04jtma4aW.RlmDnszCxGEH.WQWXqMe');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authorities`
--

DROP TABLE IF EXISTS `user_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authorities` (
  `user_id` bigint(20) NOT NULL,
  `authorities_authority` varchar(255) NOT NULL,
  KEY `FK3yqhiip97xf8rrlk3g57m1yl` (`authorities_authority`),
  KEY `FKmj13d0mnuj4cd8b6htotbf9mm` (`user_id`),
  CONSTRAINT `FKmj13d0mnuj4cd8b6htotbf9mm` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK3yqhiip97xf8rrlk3g57m1yl` FOREIGN KEY (`authorities_authority`) REFERENCES `role` (`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authorities`
--

LOCK TABLES `user_authorities` WRITE;
/*!40000 ALTER TABLE `user_authorities` DISABLE KEYS */;
INSERT INTO `user_authorities` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_ADMIN'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `user_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-17 18:12:32

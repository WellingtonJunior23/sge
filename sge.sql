-- MySQL dump 10.13  Distrib 5.6.19, for Win64 (x86_64)
--
-- Host: localhost    Database: sge
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Current Database: `sge`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sge` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sge`;

--
-- Table structure for table `tb_aluno`
--

DROP TABLE IF EXISTS `tb_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_aluno` (
  `alu_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `alu_nome` varchar(255) NOT NULL,
  `esc_codigo` int(11) NOT NULL,
  `alu_data_nascimento` date NOT NULL,
  `alu_responsavel` varchar(255) NOT NULL,
  `alu_telefone` varchar(50) NOT NULL,
  `tur_codigo` int(11) NOT NULL,
  `alu_valor_mensalidade` decimal(10,2) NOT NULL,
  `alu_vencimento` date NOT NULL,
  PRIMARY KEY (`alu_codigo`),
  KEY `esc_codigo_alu_codigo_idx` (`esc_codigo`),
  KEY `tur_codigo_alu_codigo_idx` (`tur_codigo`),
  CONSTRAINT `esc_codigo_alu_codigo` FOREIGN KEY (`esc_codigo`) REFERENCES `tb_escola` (`esc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tur_codigo_alu_codigo` FOREIGN KEY (`tur_codigo`) REFERENCES `tb_turno` (`tur_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_aluno`
--

LOCK TABLES `tb_aluno` WRITE;
/*!40000 ALTER TABLE `tb_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_escola`
--

DROP TABLE IF EXISTS `tb_escola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_escola` (
  `esc_codigo` int(11) NOT NULL,
  `esc_nome` varchar(255) NOT NULL,
  `tur_codigo` int(11) NOT NULL,
  `esc_endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`esc_codigo`),
  KEY `esc_codigo_tur_codigo_idx` (`tur_codigo`),
  CONSTRAINT `esc_codigo_tur_codigo` FOREIGN KEY (`tur_codigo`) REFERENCES `tb_turno` (`tur_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_escola`
--

LOCK TABLES `tb_escola` WRITE;
/*!40000 ALTER TABLE `tb_escola` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_escola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_financas`
--

DROP TABLE IF EXISTS `tb_financas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_financas` (
  `fin_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `alu_codigo` int(11) NOT NULL,
  `fin_valor_mensalidade` decimal(10,2) NOT NULL,
  `fin_vencimento` date NOT NULL,
  `fin_pagamento` char(1) NOT NULL,
  PRIMARY KEY (`fin_codigo`),
  KEY `alu_codigo_on_alu_codigo_idx` (`alu_codigo`),
  CONSTRAINT `fin_aluno_codigo_on_alu_codigo` FOREIGN KEY (`alu_codigo`) REFERENCES `tb_aluno` (`alu_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_financas`
--

LOCK TABLES `tb_financas` WRITE;
/*!40000 ALTER TABLE `tb_financas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_financas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_frequencia`
--

DROP TABLE IF EXISTS `tb_frequencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_frequencia` (
  `fre_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fre_dia_semana` date NOT NULL,
  `fre_data` date NOT NULL,
  `fre_p_f` char(1) NOT NULL,
  `jus_codigo` int(11) NOT NULL,
  `esc_codigo` int(11) NOT NULL,
  `alu_codido` int(11) NOT NULL,
  PRIMARY KEY (`fre_codigo`),
  KEY `fre_codigo_jus_codigo_idx` (`jus_codigo`),
  KEY `esc_codigo_on_esc_codigo_idx` (`esc_codigo`),
  KEY `alu_codigo_on_alu_codigo_idx` (`alu_codido`),
  CONSTRAINT `jus_codigo_on_jus_codigo` FOREIGN KEY (`jus_codigo`) REFERENCES `tb_justificativa` (`jus_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `esc_codigo_on_esc_codigo` FOREIGN KEY (`esc_codigo`) REFERENCES `tb_escola` (`esc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alu_codigo_on_alu_codigo` FOREIGN KEY (`alu_codido`) REFERENCES `tb_aluno` (`alu_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_frequencia`
--

LOCK TABLES `tb_frequencia` WRITE;
/*!40000 ALTER TABLE `tb_frequencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_frequencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_justificativa`
--

DROP TABLE IF EXISTS `tb_justificativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_justificativa` (
  `jus_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `jus_descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`jus_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_justificativa`
--

LOCK TABLES `tb_justificativa` WRITE;
/*!40000 ALTER TABLE `tb_justificativa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_justificativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_turno`
--

DROP TABLE IF EXISTS `tb_turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_turno` (
  `tur_codigo` int(11) NOT NULL,
  `tur_descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`tur_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turno`
--

LOCK TABLES `tb_turno` WRITE;
/*!40000 ALTER TABLE `tb_turno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_veiculo`
--

DROP TABLE IF EXISTS `tb_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_veiculo` (
  `vei_codigo` int(11) NOT NULL,
  `vei_placa` varchar(7) NOT NULL,
  `vei_modelo` varchar(50) NOT NULL,
  `vei_ano_fabricacao` year(4) NOT NULL,
  `vei_titulo` varchar(50) NOT NULL,
  `esc_codigo` int(11) NOT NULL,
  PRIMARY KEY (`vei_codigo`),
  KEY `esc_codigo_vei_codigo_idx` (`esc_codigo`),
  CONSTRAINT `esc_codigo_vei_codigo` FOREIGN KEY (`esc_codigo`) REFERENCES `tb_escola` (`esc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_veiculo`
--

LOCK TABLES `tb_veiculo` WRITE;
/*!40000 ALTER TABLE `tb_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-17 15:49:31

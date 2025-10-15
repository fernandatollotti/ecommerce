-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `ClientID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleInitial` char(3) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  PRIMARY KEY (`ClientID`),
  UNIQUE KEY `unique_cpf_client` (`CPF`),
  UNIQUE KEY `unique_cnpj_client` (`CNPJ`),
  CONSTRAINT `chk_client_type` CHECK ((((`CPF` is not null) and (`CNPJ` is null)) or ((`CPF` is null) and (`CNPJ` is not null))))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Ana','M.','Silva','11111111101',NULL,'Rua das Flores, 123','SP'),(2,'Carlos','A.','Souza','22222222202',NULL,'Av. Central, 456','RJ'),(3,'Beatriz','R.','Oliveira','33333333303',NULL,'Rua das Acácias, 789','MG'),(4,'Fernando','G.','Lima','44444444404',NULL,'Praça da Paz, 12','PR'),(5,'Juliana','F.','Mendes','55555555505',NULL,'Rua Nova, 34','RS'),(6,'Rodrigo','T.','Martins','66666666606',NULL,'Av. Brasil, 22','SP'),(7,'Camila','P.','Freitas','77777777707',NULL,'Rua Azul, 8','BA'),(8,'Paulo','C.','Nascimento','88888888808',NULL,'Rua da Esperança, 5','PE'),(9,'Larissa','B.','Costa','99999999909',NULL,'Av. das Flores, 77','GO'),(10,'Eduardo','J.','Ribeiro','10101010101',NULL,'Rua das Árvores, 99','DF'),(11,'Carlos',NULL,'Souza',NULL,'77777777000107','Rua do Comércio, 99','SP'),(12,'Fernanda',NULL,'Lima',NULL,'99999999000109','Av. das Nações, 303','RJ'),(13,'Rafael',NULL,'Mendes',NULL,'88888888000155','Rua das Indústrias, 11','MG'),(14,'Mariana',NULL,'Torres',NULL,'66666666000122','Av. dos Estilos, 45','RS'),(15,'João',NULL,'Almeida',NULL,'55555555000133','Rua dos Sabores, 22','BA');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcards` (
  `CardID` int NOT NULL AUTO_INCREMENT,
  `PaymentID` int NOT NULL,
  `CardNumber` char(16) NOT NULL,
  `CardHolderName` varchar(100) NOT NULL,
  `ExpirationDate` char(5) NOT NULL,
  `CVV` char(3) NOT NULL,
  PRIMARY KEY (`CardID`),
  KEY `fk_creditcard_payment` (`PaymentID`),
  CONSTRAINT `fk_creditcard_payment` FOREIGN KEY (`PaymentID`) REFERENCES `payments` (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
INSERT INTO `creditcards` VALUES (1,1,'4111111111111111','Ana M Silva','12/28','123'),(2,1,'5500000000000004','Ana M Silva','05/29','456'),(3,4,'4111222233334444','Fernando G Lima','11/27','789'),(4,6,'4000123412341234','Rodrigo T Martins','07/28','321');
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `Status` enum('Em processamento','Pendente','Cancelado','Concluído') DEFAULT 'Em processamento',
  `TrackingCode` char(13) DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Concluído','BR123456789SP'),(2,'Pendente','BR987654321RJ'),(3,'Em processamento','BR555555555MG'),(4,'Cancelado','BR444444444RS'),(5,'Concluído','BR333333333BA');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderpayments`
--

DROP TABLE IF EXISTS `orderpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderpayments` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `PaymentID` int NOT NULL,
  `AmountPaid` float NOT NULL,
  `PaymentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionID`),
  KEY `fk_orderpayment_order` (`OrderID`),
  KEY `fk_orderpayment_payment` (`PaymentID`),
  CONSTRAINT `fk_orderpayment_order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `fk_orderpayment_payment` FOREIGN KEY (`PaymentID`) REFERENCES `payments` (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderpayments`
--

LOCK TABLES `orderpayments` WRITE;
/*!40000 ALTER TABLE `orderpayments` DISABLE KEYS */;
INSERT INTO `orderpayments` VALUES (1,1,1,2550,'2025-10-14 19:52:27'),(2,2,2,320,'2025-10-14 19:52:27'),(3,3,3,0,'2025-10-14 19:52:27'),(4,4,4,180.5,'2025-10-14 19:52:27'),(5,5,6,950.9,'2025-10-14 19:52:27');
/*!40000 ALTER TABLE `orderpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `ClientID` int DEFAULT NULL,
  `OrderStatus` enum('Em processamento','Cancelado','Confirmado') DEFAULT 'Em processamento',
  `Description` varchar(255) DEFAULT NULL,
  `ShippingCost` float DEFAULT '10',
  `IsPaidInCash` tinyint(1) DEFAULT '0',
  `DeliveryID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_orders_client` (`ClientID`),
  KEY `fk_orders_delivery` (`DeliveryID`),
  CONSTRAINT `fk_orders_client` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  CONSTRAINT `fk_orders_delivery` FOREIGN KEY (`DeliveryID`) REFERENCES `delivery` (`DeliveryID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Confirmado','Compra de eletrônicos',25,0,NULL),(2,2,'Em processamento','Pedido de roupas',10,0,NULL),(3,3,'Cancelado','Brinquedos variados',15,0,NULL),(4,4,'Confirmado','Alimentos e bebidas',12,0,NULL),(5,5,'Confirmado','Eletrônicos e acessórios',20,0,NULL),(6,1,'Confirmado','Compra de acessórios',18,0,NULL),(7,2,'Confirmado','Pedido de calçados',15,0,NULL),(8,3,'Em processamento','Brinquedos educativos',20,0,NULL),(9,4,'Confirmado','Alimentos saudáveis',10,0,NULL),(10,5,'Em processamento','Eletrônicos pequenos',22,0,NULL),(11,1,'Cancelado','Compra de eletrônicos extras',30,0,NULL),(12,2,'Confirmado','Pedido de roupas adicionais',12,0,NULL),(13,6,'Confirmado','Produtos de higiene',25,0,NULL),(14,7,'Confirmado','Roupas infantis',18,0,NULL),(15,8,'Confirmado','Eletrônicos e acessórios',20,0,NULL),(16,9,'Confirmado','Alimentos e bebidas variadas',15,0,NULL),(17,10,'Em processamento','Brinquedos e acessórios',18,0,NULL),(18,11,'Confirmado','Pedido misto de produtos',22,0,NULL),(19,3,'Confirmado','Brinquedos e jogos educativos',20,0,NULL),(20,4,'Cancelado','Alimentos e bebidas adicionais',12,0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `ClientID` int DEFAULT NULL,
  `TypePayment` enum('Boleto','Cartão de Crédito','PIX') NOT NULL,
  `LimitAvailable` float DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_payment_client` (`ClientID`),
  CONSTRAINT `fk_payment_client` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'Cartão de Crédito',3000),(2,2,'PIX',0),(3,3,'Boleto',0),(4,4,'Cartão de Crédito',5000),(5,5,'PIX',0),(6,6,'Cartão de Crédito',1500);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) NOT NULL,
  `IsKidsClassification` tinyint(1) DEFAULT '0',
  `Category` enum('Eletrônico','Vestimenta','Brinquedo','Alimentos') NOT NULL,
  `Rating` decimal(2,1) DEFAULT '0.0',
  `Size` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Smartphone X100',0,'Eletrônico',4.5,'Médio'),(2,'Camiseta Polo',0,'Vestimenta',4.2,'M'),(3,'Boneca Fashion',1,'Brinquedo',4.8,'Único'),(4,'Chocolate Premium',0,'Alimentos',4.9,'200g'),(5,'Notebook Ultra',0,'Eletrônico',4.7,'15\"'),(6,'Calça Jeans',0,'Vestimenta',4.4,'G'),(7,'Carrinho Elétrico',1,'Brinquedo',4.6,'Grande'),(8,'Biscoito Integral',0,'Alimentos',4.3,'300g'),(9,'Fone de Ouvido',0,'Eletrônico',4.1,'Pequeno'),(10,'Vestido Floral',0,'Vestimenta',4.5,'M');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productorder` (
  `PO_ProductID` int NOT NULL,
  `PO_OrderID` int NOT NULL,
  `PO_Quantity` int DEFAULT '1',
  `PO_Status` enum('Disponível','Sem estoque') DEFAULT 'Disponível',
  PRIMARY KEY (`PO_ProductID`,`PO_OrderID`),
  KEY `fk_productorder_order` (`PO_OrderID`),
  CONSTRAINT `fk_productorder_order` FOREIGN KEY (`PO_OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `fk_productorder_product` FOREIGN KEY (`PO_ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (1,1,1,'Disponível'),(2,2,2,'Disponível'),(3,3,1,'Sem estoque'),(4,4,3,'Disponível'),(5,1,1,'Disponível'),(9,5,2,'Disponível');
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productseller`
--

DROP TABLE IF EXISTS `productseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productseller` (
  `PS_SellerID` int NOT NULL,
  `PS_ProductID` int NOT NULL,
  `ProdQuantity` int DEFAULT '1',
  PRIMARY KEY (`PS_SellerID`,`PS_ProductID`),
  KEY `fk_productseller_product` (`PS_ProductID`),
  CONSTRAINT `fk_productseller_product` FOREIGN KEY (`PS_ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `fk_productseller_seller` FOREIGN KEY (`PS_SellerID`) REFERENCES `seller` (`SellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productseller`
--

LOCK TABLES `productseller` WRITE;
/*!40000 ALTER TABLE `productseller` DISABLE KEYS */;
INSERT INTO `productseller` VALUES (1,1,50),(1,5,40),(2,3,80),(2,7,30),(3,2,60),(3,6,45),(4,9,70),(5,4,90),(5,8,55),(5,10,25);
/*!40000 ALTER TABLE `productseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstorage`
--

DROP TABLE IF EXISTS `productstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productstorage` (
  `StorageID` int NOT NULL AUTO_INCREMENT,
  `StorageLocation` varchar(255) DEFAULT NULL,
  `Quantity` int DEFAULT '0',
  `State` char(2) NOT NULL,
  PRIMARY KEY (`StorageID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstorage`
--

LOCK TABLES `productstorage` WRITE;
/*!40000 ALTER TABLE `productstorage` DISABLE KEYS */;
INSERT INTO `productstorage` VALUES (1,'Centro de Distribuição SP - Guarulhos',500,'SP'),(2,'Depósito RJ - Duque de Caxias',350,'RJ'),(3,'Galpão MG - Contagem',420,'MG'),(4,'CD Sul RS - Porto Alegre',300,'RS'),(5,'CD Nordeste PE - Recife',280,'PE'),(6,'CD Norte AM - Manaus',200,'AM'),(7,'CD Centro-Oeste GO - Goiânia',310,'GO'),(8,'CD Leste ES - Vitória',260,'ES');
/*!40000 ALTER TABLE `productstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsupplier` (
  `PS_SupplierID` int NOT NULL,
  `PS_ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`PS_SupplierID`,`PS_ProductID`),
  KEY `fk_product_supplier_product` (`PS_ProductID`),
  CONSTRAINT `fk_product_supplier_product` FOREIGN KEY (`PS_ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `fk_product_supplier_supplier` FOREIGN KEY (`PS_SupplierID`) REFERENCES `supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsupplier`
--

LOCK TABLES `productsupplier` WRITE;
/*!40000 ALTER TABLE `productsupplier` DISABLE KEYS */;
INSERT INTO `productsupplier` VALUES (1,1,100),(1,9,90),(2,2,120),(2,10,75),(3,3,150),(4,4,200),(5,5,80);
/*!40000 ALTER TABLE `productsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `SellerID` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(255) NOT NULL,
  `AbstName` varchar(255) DEFAULT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Contact` char(11) NOT NULL,
  PRIMARY KEY (`SellerID`),
  UNIQUE KEY `unique_cnpj_seller` (`CNPJ`),
  UNIQUE KEY `unique_cpf_seller` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'TechStore LTDA','TechStore','12345678000101',NULL,'São Paulo',NULL,'11999999999'),(2,'KidsWorld SA','KidsWorld','98765432000102',NULL,'Rio de Janeiro',NULL,'21988888888'),(3,'FashionHouse LTDA','FashionH','45678912000103',NULL,'Curitiba',NULL,'41977777777'),(4,'GamesOnline SA','GamesO','65432109000104',NULL,'Belo Horizonte',NULL,'31966666666'),(5,'MegaMarket LTDA','MegaM','32165487000105',NULL,'Salvador',NULL,'71955555555');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagelocation`
--

DROP TABLE IF EXISTS `storagelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storagelocation` (
  `ProductID` int NOT NULL,
  `StorageLocationID` int NOT NULL,
  `Location` varchar(255) NOT NULL,
  `State` char(2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`StorageLocationID`),
  KEY `fk_storageloc_storage` (`StorageLocationID`),
  CONSTRAINT `fk_storageloc_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `fk_storageloc_storage` FOREIGN KEY (`StorageLocationID`) REFERENCES `productstorage` (`StorageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagelocation`
--

LOCK TABLES `storagelocation` WRITE;
/*!40000 ALTER TABLE `storagelocation` DISABLE KEYS */;
INSERT INTO `storagelocation` VALUES (1,1,'Centro de Distribuição SP','SP'),(2,2,'Depósito RJ','RJ'),(3,3,'Galpão MG','MG'),(4,4,'CD Sul RS','RS'),(5,5,'CD Nordeste PE','PE'),(6,6,'CD Norte AM','AM'),(7,7,'CD Centro-Oeste GO','GO'),(8,8,'CD Leste ES','ES'),(9,1,'Centro de Distribuição SP','SP'),(10,2,'Depósito RJ','RJ');
/*!40000 ALTER TABLE `storagelocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(255) NOT NULL,
  `CNPJ` char(15) NOT NULL,
  `Contact` char(11) NOT NULL,
  `State` char(2) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE KEY `unique_supplier` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Distribuidora Alpha','11111000111','11911111111',NULL),(2,'Fornecedora Beta','22222000122','21922222222',NULL),(3,'Indústria Gama','33333000133','31933333333',NULL),(4,'Comercial Delta','44444000144','41944444444',NULL),(5,'Fábrica Épsilon','55555000155','51955555555',NULL),(6,'Super Eletrônicos SA','77777777000107','11988887777',NULL),(7,'Loja da Criança LTDA','99999999000109','21999998888',NULL),(17,'TechShop BR LTDA','88888888000155','31999998888',NULL),(18,'Casa das Roupas SA','66666666000122','51999998888',NULL),(19,'Alimentos Delícia LTDA','55555555000133','71999998888',NULL),(20,'TechStore LTDA','12345678000101','11999999999',NULL),(21,'KidsWorld SA','98765432000102','21988888888',NULL),(22,'FashionHouse LTDA','45678912000103','41977777777',NULL),(23,'GamesOnline SA','65432109000104','31966666666',NULL),(24,'MegaMarket LTDA','32165487000105','71955555555',NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 16:06:46

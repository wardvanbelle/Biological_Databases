-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: treedb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `nativetrees`
--

DROP TABLE IF EXISTS `nativetrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nativetrees` (
  `Family` varchar(100) DEFAULT NULL,
  `taxonName` varchar(100) NOT NULL,
  PRIMARY KEY (`taxonName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nativetrees`
--

LOCK TABLES `nativetrees` WRITE;
/*!40000 ALTER TABLE `nativetrees` DISABLE KEYS */;
INSERT INTO `nativetrees` VALUES ('Sapindaceae','Acer campestre L.'),('Sapindaceae','Acer pseudoplatanus L.'),('Betulaceae','Alnus glutinosa (L.) Gaertn.'),('Betulaceae','Betula pendula Roth'),('Betulaceae','Betula pubescens Ehrh.'),('Buxaceae','Buxus sempervirens L.'),('Betulaceae','Carpinus betulus L.'),('Cornaceae','Cornus mas L.'),('Betulaceae','Corylus avellana L.'),('Rosaceae','Crataegus laevigata (Poir.) DC.'),('Rosaceae','Crataegus monogyna Jacq.'),('Rosaceae','Crataegus rhipidophylla Gand.'),('Celastraceae','Euonymus europaeus L.'),('Fagaceae','Fagus sylvatica L.'),('Rhamnaceae','Frangula alnus Mill.'),('Oleaceae','Fraxinus excelsior L.'),('Elaeagnaceae','Hippophae rhamnoides L.'),('Aquifoliaceae','Ilex aquifolium L.'),('Cupressaceae','Juniperus communis L.'),('Rosaceae','Malus sylvestris (L.) Mill.'),('Salicaceae','Populus nigra L.'),('Salicaceae','Populus tremula L.'),('Rosaceae','Prunus avium (L.) L.'),('Rosaceae','Prunus mahaleb L.'),('Rosaceae','Prunus padus L.'),('Rosaceae','Prunus spinosa L.'),('Rosaceae','Pyrus communis L.'),('Rosaceae','Pyrus nivalis Jacq.'),('Fagaceae','Quercus petraea (Matt.) Liebl.'),('Fagaceae','Quercus pubescens Willd.'),('Fagaceae','Quercus robur L.'),('Rhamnaceae','Rhamnus cathartica L.'),('Salicaceae','Salix alba L.'),('Salicaceae','Salix atrocinerea Brot.'),('Salicaceae','Salix caprea L.'),('Salicaceae','Salix cinerea L.'),('Salicaceae','Salix pentandra L.'),('Salicaceae','Salix purpurea L.'),('Salicaceae','Salix triandra L.'),('Salicaceae','Salix viminalis L.'),('Viburnaceae','Sambucus nigra L.'),('Viburnaceae','Sambucus racemosa L.'),('Rosaceae','Sorbus aria (L.) Crantz'),('Rosaceae','Sorbus aucuparia L.'),('Rosaceae','Sorbus torminalis Garsault'),('Taxaceae','Taxus baccata L.'),('Malvaceae','Tilia cordata Mill.'),('Malvaceae','Tilia platyphyllos Scop.'),('Ulmaceae','Ulmus glabra Huds.'),('Ulmaceae','Ulmus laevis Pall.'),('Ulmaceae','Ulmus minor Mill.');
/*!40000 ALTER TABLE `nativetrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treesforanimals`
--

DROP TABLE IF EXISTS `treesforanimals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treesforanimals` (
  `taxonName` varchar(100) NOT NULL,
  `horse` tinyint(1) DEFAULT NULL,
  `butterfly` tinyint(1) DEFAULT NULL,
  `bee` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`taxonName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treesforanimals`
--

LOCK TABLES `treesforanimals` WRITE;
/*!40000 ALTER TABLE `treesforanimals` DISABLE KEYS */;
INSERT INTO `treesforanimals` VALUES ('Acer campestre L.',1,0,1),('Acer platanoides L.',0,0,1),('Acer pseudoplatanus L.',0,0,1),('Aesculus hippocastanum L.',0,0,1),('Alnus glutinosa (L.) Gaertn.',1,0,0),('Alnus incana (L.) Moench',1,0,0),('Betula pendula Roth',1,0,0),('Betula pubescens Ehrh.',1,0,0),('Carpinus betulus L.',1,0,0),('Castanea sativa Mill.',1,1,1),('Cornus mas L.',1,0,1),('Cornus sanguinea L.',0,1,0),('Corylus avellana L.',1,1,0),('Crataegus laevigata (Poir.) DC.',1,1,0),('Crataegus monogyna Jacq.',1,1,0),('Euonymus europaeus L.',0,1,0),('Fagus sylvatica L.',0,0,0),('Fraxinus excelsior L.',1,0,0),('Ilex aquifolium L.',0,1,1),('Juglans regia L.',0,0,1),('Mespilus germanica L.',1,0,1),('Platanus x hispanica',0,0,0),('Populus alba L.',1,1,0),('Populus nigra var. Italica Muenchh.',1,1,0),('Populus tremula L.',1,1,0),('Prunus avium (L.) L.',0,1,1),('Prunus padus L.',0,0,1),('Prunus serotina Ehrh.',0,0,0),('Prunus spinosa L.',0,1,1),('Quercus petraea (Matt.) Liebl.',0,0,0),('Quercus robur L.',0,1,0),('Quercus rubra L.',0,0,0),('Rhamnus frangula L.',0,1,1),('Rosa canina L.',1,1,1),('Rubus fruticosus L.',1,1,1),('Rubus idaeus L.',1,1,1),('Salix alba L.',1,0,1),('Salix caprea L.',1,1,1),('Salix cinerea L.',1,0,1),('Salix fragilis L.',1,0,1),('Salix pentandra L.',1,0,1),('Salix triandra L.',1,0,1),('Salix viminalis L.',1,0,1),('Salix x chrysocoma',1,0,1),('Sambucus nigra L.',0,0,0),('Sorbus aucuparia L.',0,1,1),('Tilia cordata Mill.',1,1,1),('Tilia platyphyllos Scop.',1,0,1),('Ulmus glabra Huds.',1,1,0),('Ulmus laevis Pall.',1,1,0),('Ulmus minor Mill.',1,1,0),('Viburnum opulus L.',0,0,0);
/*!40000 ALTER TABLE `treesforanimals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treeslocation`
--

DROP TABLE IF EXISTS `treeslocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treeslocation` (
  `taxonName` varchar(100) NOT NULL,
  `ranking` int DEFAULT NULL,
  PRIMARY KEY (`taxonName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treeslocation`
--

LOCK TABLES `treeslocation` WRITE;
/*!40000 ALTER TABLE `treeslocation` DISABLE KEYS */;
INSERT INTO `treeslocation` VALUES ('Acer campestre L.',4),('Acer platanoides L.',5),('Acer pseudoplatanus L.',4),('Alnus glutinosa (L.) Gaertn.',4),('Alnus incana (L.) Moench',4),('Amelanchier lamarckii F.G. Schroeder',4),('Betula pendula Roth',4),('Betula pubescens Ehrh.',4),('Carpinus betulus L.',5),('Castanea sativa Mill.',2),('Cornus mas L.',4),('Cornus sanguinea L.',4),('Corylus avellana L.',5),('Crataegus laevigata (Poiret) DC.',5),('Crataegus monogyna Jacq.',3),('Cytisus scoparius (L.) Link',2),('Euonymus europaeus L.',2),('Fagus sylvatica L.',2),('Fraxinus excelsior L.',4),('Hippophae rhamnoides L.',4),('Ilex aquifolium L.',4),('Juniperus communis L.',5),('Ligustrum vulgare L.',1),('Malus sylvestris (L.) Mill.',1),('Mespilus germanica L.',4),('Myrica gale L.',5),('Pinus sylvestris L.',4),('Populus alba L.',5),('Populus canescens (Ait.) Smith',4),('Populus nigra L.',4),('Populus nigra var. italica Muenchh.',5),('Populus tremula L.',3),('Prunus avium (L.) L.',4),('Prunus padus L.',5),('Prunus spinosa L.',3),('Prunus x fruticans Weihe',5),('Quercus petraea Lieblein',4),('Quercus robur L.',5),('Rhamnus cathartica L.',5),('Rhamnus frangula L.',4),('Ribes nigrum L.',3),('Ribes rubrum L.',4),('Ribes uva-crispa L.',4),('Rosa canina L.',2),('Rosa corymbifera Borkh.',3),('Rosa pseudoscabriuscula (R. Keller) Henker et G. Schulze',2),('Rosa rubiginosa L.',4),('Rosa spinosissima L.',3),('Rosa tomentella Léman',4),('Rubus caesius L.',3),('Rubus fruticosus L.',5),('Rubus idaeus L.',5),('Salix alba L.',1),('Salix aurita L.',5),('Salix fragilis L.',3),('Salix repens L.',4),('Salix repens subsp. dunensis Rouy',3),('Salix repens subsp. repens',5),('Salix x multinervis Döll',5),('Salix x reichardtii A. Kerner',5),('Salix x rubens Schrank',3),('Sambucus nigra L.',2),('Sambucus racemosa L.',5),('Sorbus aucuparia L.',5),('Taxus baccata L.',2),('Tilia cordata Mill.',4),('Tilia platyphyllos Scop.',2),('Tilia x europaea L.',5),('Ulex europaeus L.',5),('Ulmus glabra Huds.',5),('Ulmus laevis Pallas',5),('Vaccinium myrtillus L.',4),('Viburnum opulus L.',5);
/*!40000 ALTER TABLE `treeslocation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-18 22:27:04

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.22.0.7382
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for rva_2026
CREATE DATABASE IF NOT EXISTS `rva_2026` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `rva_2026`;

-- Dumping structure for table rva_2026.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table rva_2026.category: ~5 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(101, 'Proteini'),
	(102, 'Kreatini'),
	(103, 'Aminokiseline'),
	(104, 'Oprema'),
	(105, 'Vitamini');

-- Dumping structure for table rva_2026.item
CREATE TABLE IF NOT EXISTS `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `act` double DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `isLimit` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FKcbb00pscxdda34eptqhpimpxx` (`category_id`),
  CONSTRAINT `FKcbb00pscxdda34eptqhpimpxx` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table rva_2026.item: ~82 rows (approximately)
INSERT INTO `item` (`item_id`, `act`, `amount`, `created_at`, `deleted_at`, `img`, `isLimit`, `name`, `opis`, `price`, `updated_at`, `category_id`) VALUES
	(1, NULL, 14, '2026-01-01 10:00:00.000000', NULL, 'assets/img1.jpg', 0, 'ON Gold Standard Whey 2.27kg', 'Izolat, koncentrat i peptidi surutke za oporavak.', 8400, NULL, 101),
	(2, NULL, 25, '2026-01-02 10:00:00.000000', NULL, 'assets/img2.jpg', 0, 'Myprotein Impact Whey', 'Koncentrat proteina surutke za svakodnevni unos.', 4200, NULL, 101),
	(3, NULL, 12, '2026-01-03 10:00:00.000000', NULL, 'assets/img3.jpg', 1, 'Dymatize ISO100 Hydrolyzed', 'Hidrolizovani whey izolat sa 25g proteina.', 7900, NULL, 101),
	(4, NULL, 9, '2026-01-04 10:00:00.000000', NULL, 'assets/img4.jpg', 1, 'BioTechUSA Iso Whey Zero 2.27kg', 'Izolat bez laktoze, šećera i glutena.', 9200, NULL, 101),
	(5, NULL, 18, '2026-01-05 10:00:00.000000', NULL, 'assets/img5.jpg', 0, 'Scitec 100% Whey Protein', 'Whey protein sa aminokiselinama i enzimima.', 5600, NULL, 101),
	(6, NULL, 15, '2026-01-06 10:00:00.000000', NULL, 'assets/img6.jpg', 0, 'Rule 1 R1 Whey Blend', 'Mešavina whey proteina bogata BCAA.', 6100, NULL, 101),
	(7, NULL, 22, '2026-01-07 10:00:00.000000', NULL, 'assets/img7.jpg', 0, 'Olimp Creatine Creapure 500g', 'Mikronizovani kreatin monohidrat Creapure.', 3100, NULL, 102),
	(8, NULL, 11, '2026-01-08 10:00:00.000000', NULL, 'assets/img8.jpg', 1, 'MuscleTech Cell-Tech 1.36kg', 'Formula kreatina za snagu i oporavak.', 5900, NULL, 102),
	(9, NULL, 20, '2026-01-09 10:00:00.000000', NULL, 'assets/img9.jpg', 0, 'BioTechUSA Creatine PH-X', 'Puferovani kreatin u kapsulama.', 2750, NULL, 102),
	(10, NULL, 26, '2026-01-10 10:00:00.000000', NULL, 'assets/img10.jpg', 0, 'Dymatize Creatine Micronized 300g', 'Čist mikronizovani kreatin monohidrat.', 2350, NULL, 102),
	(11, NULL, 24, '2026-01-11 10:00:00.000000', NULL, 'assets/img11.jpg', 0, 'Scitec Crea Caps', 'Kreatin monohidrat u kapsulama za snagu.', 2200, NULL, 102),
	(12, NULL, 20, '2026-01-12 10:00:00.000000', NULL, 'assets/img12.jpg', 0, 'Scitec BCAA Xpress 350g', 'BCAA 2:1:1 u prahu bez šećera.', 2450, NULL, 103),
	(13, NULL, 18, '2026-01-13 10:00:00.000000', NULL, 'assets/img13.jpg', 0, 'ON Essential Amino Energy', 'Esencijalne aminokiseline i energija.', 3300, NULL, 103),
	(14, NULL, 22, '2026-01-14 10:00:00.000000', NULL, 'assets/img14.jpg', 0, 'BioTechUSA BCAA Zero 360g', 'BCAA 2:1:1 formula sa vitaminom B6.', 2600, NULL, 103),
	(15, NULL, 17, '2026-01-15 10:00:00.000000', NULL, 'assets/img15.jpg', 0, 'Dymatize BCAA 2200', 'Aminokiseline razgranatog lanca u kapsulama.', 2500, NULL, 103),
	(16, NULL, 15, '2026-01-16 10:00:00.000000', NULL, 'assets/img16.jpg', 1, 'Scivation Xtend Original 7g BCAA', '7g BCAA i elektroliti za oporavak.', 3600, NULL, 103),
	(17, NULL, 19, '2026-01-17 10:00:00.000000', NULL, 'assets/img17.jpg', 0, 'Cellucor C4 Original Pre-Workout', 'Pre-workout za energiju i fokus.', 3400, NULL, 103),
	(18, NULL, 12, '2026-01-18 10:00:00.000000', NULL, 'assets/img18.jpg', 1, 'BSN N.O.-Xplode 650g', 'Pre-workout za snagu i prokrvljenost.', 4100, NULL, 103),
	(19, NULL, 14, '2026-01-19 10:00:00.000000', NULL, 'assets/img19.jpg', 1, 'Redcon1 Total War 444g', 'Intenzivna pre-workout formula.', 4300, NULL, 103),
	(20, NULL, 13, '2026-01-20 10:00:00.000000', NULL, 'assets/img20.jpg', 1, 'Ghost Legend Pre-Workout', 'Pre-workout suplement za teške serije.', 4200, NULL, 103),
	(21, NULL, 18, '2026-01-21 10:00:00.000000', NULL, 'assets/img21.jpg', 1, 'The Curse! Pre-Workout', 'Pre-workout za energiju i intenzivan trening.', 3100, NULL, 103),
	(22, NULL, 11, '2026-01-22 10:00:00.000000', NULL, 'assets/img22.jpg', 1, 'ON Serious Mass 12lb', 'Visokokalorični gejner za dobijanje mase.', 7900, NULL, 101),
	(23, NULL, 13, '2026-01-23 10:00:00.000000', NULL, 'assets/img23.jpg', 1, 'Mutant Mass Gainer', 'Gejner za povećanje mišićne mase.', 6800, NULL, 101),
	(24, NULL, 10, '2026-01-24 10:00:00.000000', NULL, 'assets/img24.jpg', 0, 'Dymatize Super Mass Gainer', 'Proteini, BCAA i ugljeni hidrati za masu.', 7200, NULL, 101),
	(25, NULL, 14, '2026-01-25 10:00:00.000000', NULL, 'assets/img25.jpg', 0, 'BSN True-Mass Gainer', 'Proteinski i ugljenohidratni kompleks.', 6500, NULL, 101),
	(26, NULL, 16, '2026-01-26 10:00:00.000000', NULL, 'assets/img26.jpg', 0, 'BioTechUSA Hyper Mass', 'Gejner sa proteinima, hidratima i kreatinom.', 5400, NULL, 101),
	(27, NULL, 12, '2026-01-27 10:00:00.000000', NULL, 'assets/img27.jpg', 1, 'Universal Animal Cuts', 'Kompleksni metabolički suplement u kesicama.', 4800, NULL, 105),
	(28, NULL, 22, '2026-01-28 10:00:00.000000', NULL, 'assets/img28.jpg', 0, 'BioTechUSA L-Carnitine Liquid', 'Tečni L-karnitin sa vitaminima i zelenim čajem.', 2300, NULL, 105),
	(29, NULL, 25, '2026-01-29 10:00:00.000000', NULL, 'assets/img29.jpg', 0, 'Grenade Šejker Narandžasti', 'Šejker za pripremu šejkova u teretani.', 1350, NULL, 104),
	(30, NULL, 15, '2026-01-30 10:00:00.000000', NULL, 'assets/img30.jpg', 0, 'MuscleTech Hydroxycut Elite', 'Termogena formula u kapsulama.', 3500, NULL, 105),
	(31, NULL, 14, '2026-01-31 10:00:00.000000', NULL, 'assets/img31.jpg', 1, 'Universal Animal Pak 44 Packs', 'Kompletan multivitaminski i mineralni paket za sportiste.', 5200, NULL, 105),
	(32, NULL, 21, '2026-02-01 10:00:00.000000', NULL, 'assets/img32.jpg', 0, 'ON Opti-Men 90 Tablets', 'Multivitaminska formula za aktivne muškarce i imunitet.', 2900, NULL, 105),
	(33, NULL, 19, '2026-02-02 10:00:00.000000', NULL, 'assets/img33.jpg', 0, 'ON Opti-Women', 'Vitaminsko-mineralni kompleks prilagođen ženama.', 2600, NULL, 105),
	(34, NULL, 28, '2026-02-03 10:00:00.000000', NULL, 'assets/img34.jpg', 0, 'Omega-3 Fish Oil 1000mg 100 Caps', 'Riblje ulje bogato omega-3 masnim kiselinama.', 2100, NULL, 105),
	(35, NULL, 35, '2026-02-04 10:00:00.000000', NULL, 'assets/img35.jpg', 0, 'Vitamin C 1000mg 30 Kesica', 'Visoka doza vitamina C za imunitet i oporavak.', 1100, NULL, 105),
	(36, NULL, 24, '2026-02-05 10:00:00.000000', NULL, 'assets/img36.jpg', 0, 'Magnesium Citrate 250mg', 'Magnezijum citrat za mišiće, nervni sistem i kosti.', 1750, NULL, 105),
	(37, NULL, 45, '2026-02-06 10:00:00.000000', NULL, 'assets/img37.jpg', 0, 'Grenade Carb Killa Cookies & Cream', 'Proteinska čokoladica sa malo šećera i ukusom keksa.', 380, NULL, 101),
	(38, NULL, 40, '2026-02-07 10:00:00.000000', NULL, 'assets/img38.jpg', 0, 'Barebells Protein Bar Mix', 'Mekane proteinske čokoladice različitih ukusa bez šećera.', 420, NULL, 101),
	(39, NULL, 38, '2026-02-08 10:00:00.000000', NULL, 'assets/img39.jpg', 0, 'Quest Protein Bar Mix', 'Proteinske čokoladice sa 20g proteina i vlaknima.', 390, NULL, 101),
	(40, NULL, 12, '2026-02-09 10:00:00.000000', NULL, 'assets/img40.jpg', 1, 'Myprotein Layered Bar Box', 'Kutija slojevitih proteinskih čokoladica Cookies & Cream.', 3900, NULL, 101),
	(41, NULL, 40, '2026-02-10 10:00:00.000000', NULL, 'assets/img41.jpg', 0, 'Gatorade Zero Sugar 500ml', 'Osvežavajući napitak bez šećera za hidrataciju tokom treninga.', 220, NULL, 105),
	(42, NULL, 20, '2026-02-11 10:00:00.000000', NULL, 'assets/img42.jpg', 0, 'Powerade Mountain Blast 6x500ml', 'Paket od 6 izotoničnih napitaka sa elektrolitima.', 1150, NULL, 105),
	(43, NULL, 18, '2026-02-12 10:00:00.000000', NULL, 'assets/img43.jpg', 0, 'Isostar Hydrate & Perform', 'Izotonični napitak sa vitaminom C za izdržljivost.', 1650, NULL, 105),
	(44, NULL, 22, '2026-02-13 10:00:00.000000', NULL, 'assets/img44.jpg', 0, 'OSHEE Vitamin Water Set', 'Vitaminske vode sa mineralima i magnezijumom.', 980, NULL, 105),
	(45, NULL, 15, '2026-02-14 10:00:00.000000', NULL, 'assets/img45.jpg', 0, 'Thema Sport Pojas za Trening', 'Pojas za stabilizaciju donjeg dela leđa pri dizanju tegova.', 2400, NULL, 104),
	(46, NULL, 28, '2026-02-15 10:00:00.000000', NULL, 'assets/img46.jpg', 0, 'GymBeam Gurtne za Tegove', 'Gurtne za jači hvat pri vežbama vučenja i mrtvom dizanju.', 1150, NULL, 104),
	(47, NULL, 24, '2026-02-16 10:00:00.000000', NULL, 'assets/img47.jpg', 0, 'Set Elastičnih Traka za Vežbanje', 'Pet traka različitih otpora sa torbicom za nošenje.', 1600, NULL, 104),
	(48, NULL, 30, '2026-02-17 10:00:00.000000', NULL, 'assets/img48.jpg', 0, 'Brza Vijaca za Trening', 'Podesiva vijaca za kondiciju, kardio i agilnost.', 1100, NULL, 104),
	(49, NULL, 16, '2026-02-18 10:00:00.000000', NULL, 'assets/img49.jpg', 1, 'Nike Rukavice za Teretanu', 'Rukavice za zaštitu dlanova i bolji grip na spravama.', 2700, NULL, 104),
	(50, NULL, 26, '2026-02-19 10:00:00.000000', NULL, 'assets/img50.jpg', 0, 'Simond Magnezijum Chalk 200g', 'Magnezijum u prahu za siguran hvat bez klizanja.', 950, NULL, 104),
	(51, NULL, 22, '2026-02-20 10:00:00.000000', NULL, 'assets/img51.jpg', 0, 'SmartShake Šejker Kolekcija', 'Praktični šejkeri sa pregradama za suplemente.', 1450, NULL, 104),
	(52, NULL, 16, '2026-02-21 10:00:00.000000', NULL, 'assets/img52.jpg', 0, 'Amix Metalni Šejker', 'Izdržljivi metalni šejker za pripremu šejkova.', 1850, NULL, 104),
	(53, NULL, 19, '2026-02-22 10:00:00.000000', NULL, 'assets/img53.jpg', 0, 'Gorilla Wear Flaša za Vodu', 'Velika flaša za hidrataciju tokom treninga.', 1500, NULL, 104),
	(54, NULL, 25, '2026-02-23 10:00:00.000000', NULL, 'assets/img54.jpg', 0, 'BlenderBottle Šejkeri', 'Šejkeri sa žičanom kuglicom za glatko mućenje.', 1400, NULL, 104),
	(55, NULL, 30, '2026-02-24 10:00:00.000000', NULL, 'assets/img55.jpg', 0, 'Flašice za Vodu sa Oznakama', 'Flašice sa oznakama unosa vode tokom dana.', 1200, NULL, 104),
	(56, NULL, 32, '2026-02-25 10:00:00.000000', NULL, 'assets/img56.jpg', 0, 'Kikiriki Puter Tegla', 'Kremasti puter od kikirikija za obroke i šejkove.', 650, NULL, 105),
	(57, NULL, 20, '2026-02-26 10:00:00.000000', NULL, 'assets/img57.jpg', 0, 'dmBio Bademov Puter 250g', 'Organski puter od 100% pečenih badema.', 980, NULL, 105),
	(58, NULL, 45, '2026-02-27 10:00:00.000000', NULL, 'assets/img58.jpg', 0, 'Fun&Fit Ovsene Pahuljice 250g', 'Organske ovsene pahuljice bogate vlaknima.', 320, NULL, 105),
	(59, NULL, 26, '2026-02-28 10:00:00.000000', NULL, 'assets/img59.jpg', 0, 'Proteini.si Zero Syrup Cocoa 320ml', 'Kakao sirup bez šećera i masti za poslastice.', 790, NULL, 105),
	(60, NULL, 28, '2026-03-01 10:00:00.000000', NULL, 'assets/img60.jpg', 0, 'dmBio Čia Seme 500g', 'Organsko čia seme bogato omega-3 i vlaknima.', 740, NULL, 105),
	(61, NULL, 25, '2026-03-02 10:00:00.000000', NULL, 'assets/img61.jpg', 0, 'Kokosovo Ulje Ekstra Devičansko', 'Hladno ceđeno organsko kokosovo ulje za kuvanje i obroke.', 850, NULL, 105),
	(62, NULL, 18, '2026-03-03 10:00:00.000000', NULL, 'assets/img62.jpg', 0, 'Glutamine Powder 500g', 'Čist L-glutamin u prahu bez ukusa za oporavak.', 2400, NULL, 103),
	(63, NULL, 20, '2026-03-04 10:00:00.000000', NULL, 'assets/img63.jpg', 0, 'ON ZMA Capsules 90', 'Kombinacija cinka, magnezijuma i vitamina B6.', 2250, NULL, 105),
	(64, NULL, 15, '2026-03-05 10:00:00.000000', NULL, 'assets/img64.jpg', 1, 'Scitec G-Bomb Glutamin', 'Napredna glutaminska formula za oporavak posle treninga.', 2950, NULL, 103),
	(65, NULL, 24, '2026-03-06 10:00:00.000000', NULL, 'assets/img65.jpg', 0, 'BioTechUSA Recovery Gel', 'Gel za oporavak sa amino kiselinama i ukusom višnje.', 1900, NULL, 103),
	(66, NULL, 16, '2026-03-07 10:00:00.000000', NULL, 'assets/img66.jpg', 0, 'NOW Sports HMB 1000mg', 'HMB tablete za očuvanje mišićne mase i oporavak.', 2800, NULL, 103),
	(67, NULL, 13, '2026-03-08 10:00:00.000000', NULL, 'assets/img67.jpg', 0, '100% Casein Protein', 'Sporo-apsorbujući kazein protein pogodan pred spavanje.', 5800, NULL, 101),
	(68, NULL, 14, '2026-03-09 10:00:00.000000', NULL, 'assets/img68.jpg', 1, 'ESN Isoclear Whey Isolate', 'Osvežavajući izolat proteina surutke u kesicama.', 6400, NULL, 101),
	(69, NULL, 22, '2026-03-10 10:00:00.000000', NULL, 'assets/img69.jpg', 0, 'Protein Pancake Mix 700g', 'Mešavina za pripremu proteinskih palačinki.', 2100, NULL, 101),
	(70, NULL, 30, '2026-03-11 10:00:00.000000', NULL, 'assets/img70.jpg', 0, 'Scitec Flavour Drops 50ml', 'Kapi bez šećera za dodavanje ukusa kašama i šejkovima.', 750, NULL, 105),
	(71, NULL, 17, '2026-03-12 10:00:00.000000', NULL, 'assets/img71.jpg', 0, 'Gymshark Kompresiona Majica', 'Elastična kompresiona majica za trening i bolju podršku.', 3200, NULL, 104),
	(72, NULL, 19, '2026-03-13 10:00:00.000000', NULL, 'assets/img72.jpg', 0, 'Nutrend EAA Mega Strong 300g', 'Esencijalne aminokiseline u prahu sa vitaminima i cinkom.', 2850, NULL, 103),
	(73, NULL, 45, '2026-03-14 10:00:00.000000', NULL, 'assets/img73.jpg', 0, 'Little Dragon Pre-Workout Shot', 'Praktičan tečni shot pre treninga sa kofeinom.', 260, NULL, 103),
	(74, NULL, 32, '2026-03-15 10:00:00.000000', NULL, 'assets/img74.jpg', 0, 'Strong Nature Vitamin D3 2000 IU', 'Vitamin D3 u mekim kapsulama za imunitet i kosti.', 950, NULL, 105),
	(75, NULL, 28, '2026-03-16 10:00:00.000000', NULL, 'assets/img75.jpg', 0, 'Scitec Zinc 100 Tableta', 'Cink u tabletama za imunitet, oporavak i metabolizam.', 1250, NULL, 105),
	(76, NULL, 16, '2026-03-17 10:00:00.000000', NULL, 'assets/img76.jpg', 0, 'Monster Energy Ultra 12x500ml', 'Paket od 12 limenki energetskog napitka bez šećera.', 1800, NULL, 105),
	(77, NULL, 10, '2026-03-18 10:00:00.000000', NULL, 'assets/img77.jpg', 1, 'Monster Energy Ultra Black Paket', 'Zbirno pakovanje energetskog napitka Ultra Black bez šećera.', 3400, NULL, 105),
	(78, NULL, 35, '2026-03-19 10:00:00.000000', NULL, 'assets/img78.jpg', 0, 'Monster Energy Ultra Peachy Keen', 'Energetski napitak sa ukusom breskve i bez šećera.', 210, NULL, 105),
	(79, NULL, 30, '2026-03-20 10:00:00.000000', NULL, 'assets/img79.jpg', 1, 'Monster Energy Lando Norris', 'Specijalno izdanje energetskog napitka bez šećera.', 220, NULL, 105),
	(80, NULL, 14, '2026-03-21 10:00:00.000000', NULL, 'assets/img80.jpg', 0, 'Monster Full Throttle 12x500ml', 'Paket od 12 limenki energetskog napitka Full Throttle.', 1850, NULL, 105),
	(81, NULL, 15, '2026-03-22 10:00:00.000000', NULL, 'assets/img81.jpg', 0, 'Monster Pipeline Punch 12x500ml', 'Paket od 12 limenki energetskog napitka sa voćnim ukusom.', 1900, NULL, 105),
	(82, NULL, 32, '2026-03-23 10:00:00.000000', NULL, 'assets/img82.jpg', 1, 'Monster Juiced Bad Apple 500ml', 'Energetski napitak sa voćnim sokom i ukusom jabuke.', 230, NULL, 105);

-- Dumping structure for table rva_2026.order
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table rva_2026.order: ~3 rows (approximately)
INSERT INTO `order` (`order_id`, `amount`, `order_date`, `status`, `total_price`, `user_id`) VALUES
	(1, 4, '2026-11-19 16:30:51.000000', 'PENDING', 13340, 1),
	(2, 5, '2026-11-19 17:18:51.000000', 'PENDING', 18500, 1),
	(3, 2, '2026-11-19 17:27:43.000000', 'PENDING', 22200, 1);

-- Dumping structure for table rva_2026.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table rva_2026.order_items: ~11 rows (approximately)
INSERT INTO `order_items` (`id`, `amount`, `item_id`, `order_id`, `price`, `total`) VALUES
	(1, 1, 59, 1, 790, 790),
	(2, 2, 69, 1, 2100, 4200),
	(3, 1, 51, 1, 1450, 1450),
	(4, 3, 28, 1, 2300, 6900),
	(5, 1, 2, 2, 4200, 4200),
	(6, 1, 6, 2, 6100, 6100),
	(7, 1, 7, 2, 3100, 3100),
	(8, 1, 45, 2, 2400, 2400),
	(9, 1, 49, 2, 2700, 2700),
	(10, 2, 69, 3, 2100, 4200),
	(11, 5, 16, 3, 3600, 18000);

-- Dumping structure for table rva_2026.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table rva_2026.user: ~2 rows (approximately)
INSERT INTO `user` (`user_id`, `address`, `city`, `email`, `first_name`, `last_name`, `password`, `phone_number`) VALUES
	(1, 'Adresa 1', 'Smederevo', 'korisnik1@gmail.com', 'korisnik', '1', '$2a$10$QkT8ekZg.o5JUufLecvDteM9IlqjslpZywu9.UqQd/4yi1A9DLUmW', '061 123 45 67'),
	(2, 'Adresa 2', 'Beograd', 'korisnik2@gmail.com', 'korisnik', '2', '$2a$10$E5HgQIy9LM4mb5k.rPmqgOomidldcvFbSzr5qScwqlM1t4Vr1zCq.', '064 123 34 56');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

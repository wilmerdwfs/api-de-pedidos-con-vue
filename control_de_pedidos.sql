-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.38-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla control_de_pedidos.c_clientes
CREATE TABLE IF NOT EXISTS `c_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  KEY `Índice 1` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla control_de_pedidos.c_clientes: ~15 rows (aproximadamente)
INSERT INTO `c_clientes` (`id`, `nombre`) VALUES
	(1, 'Constructora Solidez S.A.'),
	(2, 'Distribuciones La Gran Oferta'),
	(3, 'Supermercado El Buen Precio'),
	(4, 'Ferretería Central'),
	(5, 'Librería y Papelería Estrella'),
	(36, 'Mr. Domenick Hegmann Sr.'),
	(37, 'Faye Osinski'),
	(38, 'Antonio Mosciski'),
	(39, 'Annabell Heathcote'),
	(40, 'Prof. Mitchel Parker'),
	(41, 'Maximillian Jast'),
	(42, 'Mrs. Simone Koss'),
	(43, 'Mr. Glen Crist'),
	(44, 'Walter Senger'),
	(45, 'Sally Hettinger');

-- Volcando estructura para tabla control_de_pedidos.c_pedidos
CREATE TABLE IF NOT EXISTS `c_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecDoc` date DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idSitioEntrega` int(11) DEFAULT NULL,
  KEY `Índice 1` (`id`),
  KEY `Índice 2` (`idCliente`),
  KEY `Índice 3` (`idSitioEntrega`),
  CONSTRAINT `FK_c_pedidos_c_clientes` FOREIGN KEY (`idCliente`) REFERENCES `c_clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c_pedidos_c_sitios_entrega` FOREIGN KEY (`idSitioEntrega`) REFERENCES `c_sitios_entrega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla control_de_pedidos.c_pedidos: ~8 rows (aproximadamente)
INSERT INTO `c_pedidos` (`id`, `fecDoc`, `idCliente`, `idSitioEntrega`) VALUES
	(29, '2025-06-11', 2, 4),
	(30, '2025-06-16', 38, 38),
	(31, '2025-06-16', 39, 39),
	(32, '2025-06-16', 40, 40),
	(33, '2025-06-16', 41, 41),
	(34, '2025-06-16', 42, 42),
	(35, '2025-06-16', 43, 43),
	(36, '2025-06-16', 44, 44),
	(37, '2025-06-16', 45, 45);

-- Volcando estructura para tabla control_de_pedidos.c_pedidos_d
CREATE TABLE IF NOT EXISTS `c_pedidos_d` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) DEFAULT NULL,
  `idArticulo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `totalBruto` double(22,0) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  KEY `Índice 1` (`id`) USING BTREE,
  KEY `Índice 2` (`idArticulo`),
  KEY `Índice 3` (`idPedido`),
  CONSTRAINT `FK_c_pedidos_d_c_pedidos` FOREIGN KEY (`idPedido`) REFERENCES `c_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla control_de_pedidos.c_pedidos_d: ~17 rows (aproximadamente)
INSERT INTO `c_pedidos_d` (`id`, `idPedido`, `idArticulo`, `cantidad`, `totalBruto`, `precio`) VALUES
	(33, 29, 4, 4, 220000, 55000),
	(34, 29, 9, 5, 275000, 55000),
	(35, 30, 87, 2, 200, 100),
	(36, 30, 88, 1, 150, 150),
	(37, 31, 89, 2, 200, 100),
	(38, 31, 90, 1, 150, 150),
	(39, 32, 91, 2, 200, 100),
	(40, 32, 92, 1, 150, 150),
	(41, 33, 96, 2, 200, 100),
	(42, 33, 97, 1, 150, 150),
	(43, 34, 98, 2, 200, 100),
	(44, 34, 99, 1, 150, 150),
	(45, 35, 103, 2, 200, 100),
	(46, 35, 104, 1, 150, 150),
	(47, 36, 108, 2, 200, 100),
	(48, 36, 109, 1, 150, 150),
	(49, 37, 113, 2, 200, 100),
	(50, 37, 114, 1, 150, 150);

-- Volcando estructura para tabla control_de_pedidos.c_sitios_entrega
CREATE TABLE IF NOT EXISTS `c_sitios_entrega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  KEY `Índice 1` (`id`) USING BTREE,
  KEY `Índice 2` (`idCliente`),
  CONSTRAINT `FK_c_sitios_engrega_c_clientes` FOREIGN KEY (`idCliente`) REFERENCES `c_clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla control_de_pedidos.c_sitios_entrega: ~16 rows (aproximadamente)
INSERT INTO `c_sitios_entrega` (`id`, `nombre`, `idCliente`) VALUES
	(1, 'Bodega Principal - Constructora Solidez', 1),
	(2, 'Sucursal Norte - Constructora Solidez', 1),
	(3, 'Almacén Central - Distribuciones La Gran Oferta', 2),
	(4, 'Tienda Zona 5 - Distribuciones La Gran Oferta', 2),
	(5, 'Supermercado Plaza Central', 3),
	(6, 'Supermercado Ciudadela', 3),
	(7, 'Ferretería Central Sucursal 1', 4),
	(8, 'Ferretería Central Sucursal 2', 4),
	(9, 'Librería Estrella Centro', 5),
	(10, 'Librería Estrella Sur', 5),
	(38, '211 Gusikowski Street\nEast Juvenalport, FL 42429', 38),
	(39, '39832 Murazik Mountains Apt. 939\nLake Alyson, OR 47700', 39),
	(40, '45203 Graham Mountains\nNorth Royce, CT 53276', 40),
	(41, '1944 Feeney Crossroad\nSkilesport, NC 52581-1804', 41),
	(42, '6653 Effertz Island Suite 822\nWest Dewayne, VA 55532', 42),
	(43, '802 Micheal Shoal\nBrannonbury, ND 14693-4262', 43),
	(44, '355 Nannie Parkway Suite 683\nWest Olaf, NJ 69026-0572', 44),
	(45, '8297 Dustin Streets Suite 092\nLake Maeve, DC 05478-6829', 45);

-- Volcando estructura para tabla control_de_pedidos.i_articulos
CREATE TABLE IF NOT EXISTS `i_articulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  KEY `Índice 1` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla control_de_pedidos.i_articulos: ~66 rows (aproximadamente)
INSERT INTO `i_articulos` (`id`, `nombre`, `precio`, `cantidad`) VALUES
	(1, 'Lápiz HB', 55000, 55000),
	(2, 'Cuaderno A4', 55000, 55000),
	(3, 'Bolígrafo azul', 55000, 55000),
	(4, 'Marcador permanente', 55000, 55000),
	(5, 'Regla 30 cm', 55000, 55000),
	(6, 'Goma de borrar', 55000, 55000),
	(7, 'Tijeras escolares', 55000, 55000),
	(8, 'Pegamento en barra', 55000, 55000),
	(9, 'Calculadora científica', 55000, 55000),
	(10, 'Carpeta plástica', 55000, 55000),
	(11, 'Resaltador amarillo', 55000, 55000),
	(12, 'Cinta adhesiva', 55000, 55000),
	(13, 'Mochila escolar', 55000, 55000),
	(14, 'Libro de matemáticas', 55000, 55000),
	(15, 'Silla ergonómica', 55000, 55000),
	(16, 'Escritorio de madera', 55000, 55000),
	(17, 'Agenda diaria', 55000, 55000),
	(18, 'Mouse inalámbrico', 55000, 55000),
	(19, 'Teclado mecánico', 55000, 55000),
	(20, 'Monitor 24 pulgadas', 55000, 55000),
	(21, 'Cable USB-C', 55000, 55000),
	(22, 'Memoria USB 16GB', 55000, 55000),
	(23, 'Auriculares con micrófono', 55000, 55000),
	(24, 'Impresora láser', 55000, 55000),
	(25, 'Cartucho tinta negra', 55000, 55000),
	(26, 'Portafolios ejecutivo', 444, 55000),
	(27, 'Lámpara de escritorio', 55000, 55000),
	(28, 'Botella de agua 500ml', 55000, 55000),
	(29, 'Silla plegable', 55000, 55000),
	(30, 'Reloj despertador digital', 55000, 55000),
	(81, 'Lapicero Azul', 55000, 55000),
	(82, 'Cuaderno', 55000, 55000),
	(83, 'Borrador', 55000, 55000),
	(84, 'Lapicero Azul', 27528.03, 44744),
	(85, 'Cuaderno', 98071.94, 62973),
	(86, 'Borrador', 39648.04, 87062),
	(87, 'consequatur', 18183.54, 90164),
	(88, 'accusantium', 94288.82, 69186),
	(89, 'natus', 83949.08, 87209),
	(90, 'aperiam', 6263.15, 22605),
	(91, 'quo', 13932.16, 48327),
	(92, 'nesciunt', 24005.32, 98250),
	(93, 'Lapicero Azul', 64605, 15309),
	(94, 'Cuaderno', 49638.31, 5637),
	(95, 'Borrador', 93790.36, 79861),
	(96, 'voluptatem', 13969.91, 18821),
	(97, 'ratione', 11927.83, 90105),
	(98, 'provident', 98923.18, 36395),
	(99, 'molestiae', 22449.42, 27629),
	(100, 'Lapicero Azul', 87472.34, 77456),
	(101, 'Cuaderno', 21123.74, 37921),
	(102, 'Borrador', 76430.07, 1065),
	(103, 'mollitia', 79682.45, 98556),
	(104, 'rerum', 52539.93, 40130),
	(105, 'Lapicero Azul', 61784.62, 89484),
	(106, 'Cuaderno', 71272.95, 2223),
	(107, 'Borrador', 54979.88, 88444),
	(108, 'maxime', 76748.74, 62789),
	(109, 'perspiciatis', 59993.1, 60740),
	(110, 'Lapicero Azul', 52328.27, 81010),
	(111, 'Cuaderno', 55471.58, 9131),
	(112, 'Borrador', 11509.34, 63542),
	(113, 'omnis', 84260.3, 73413),
	(114, 'at', 38361.54, 77350),
	(115, 'Lapicero Azul', 67606.61, 9108),
	(116, 'Cuaderno', 38699.63, 75388),
	(117, 'Borrador', 52996.06, 93790);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

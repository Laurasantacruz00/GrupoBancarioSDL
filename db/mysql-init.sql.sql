-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2019 a las 04:18:45
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `transaccionesbancarias`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `autenticar` (IN `cuenta` VARCHAR(40), IN `pass` INTEGER)  BEGIN
    SELECT * FROM cajeros WHERE numero_cuenta = cuenta AND clave = pass;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consignaciones` (IN `n_cuenta` INT, IN `n_saldo` INT)  BEGIN	
	UPDATE cajeros SET saldo=saldo+n_saldo WHERE numero_cuenta=n_cuenta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuarios` (IN `N_cuenta` VARCHAR(40), IN `n_titular` VARCHAR(40), IN `n_clave` INTEGER, IN `n_saldo` VARCHAR(40))  BEGIN
        INSERT INTO cajeros (numero_cuenta,titular,clave,saldo) VALUES (N_cuenta,n_titular,n_clave,n_saldo);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUsuarios` ()  BEGIN
        SELECT * FROM cajeros;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `retiros` (IN `n_cuenta` INT, IN `n_saldo` INT)  BEGIN	
	UPDATE cajeros SET saldo=saldo-n_saldo WHERE numero_cuenta=n_cuenta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `transaccion` (IN `N_cuenta_O` VARCHAR(40), IN `N_cuenta_D` VARCHAR(40), IN `n_saldo` VARCHAR(40))  BEGIN
        UPDATE cajeros SET saldo = saldo - n_saldo WHERE numero_cuenta = N_cuenta_O;
        UPDATE cajeros SET saldo = saldo + n_saldo WHERE numero_cuenta = N_cuenta_D;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajeros`
--

CREATE TABLE `cajeros` (
  `numero_cuenta` varchar(40) NOT NULL,
  `titular` varchar(40) DEFAULT NULL,
  `clave` int(4) DEFAULT NULL,
  `saldo` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajeros`
--

INSERT INTO `cajeros` (`numero_cuenta`, `titular`, `clave`, `saldo`) VALUES
('1001780239', 'Laura Santacruz', 2345, 6330000),
('12345678', 'Laura Santacruz', 1234, NULL),
('204789878', 'ion velasco', 1234, 463000),
('4562', 'Prueba', 3215, 1000000),
('78899', 'Danilin', 1234, NULL),
('908756', 'Prueba', 894, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajeros`
--
ALTER TABLE `cajeros`
  ADD PRIMARY KEY (`numero_cuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2018 a las 16:47:26
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `recomendationsystem`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Screencast'),
(2, 'Talking head video'),
(3, 'Presentations'),
(4, 'Conferences'),
(5, 'Lecture Recordings'),
(6, 'Classroom recordings'),
(7, 'Interviews'),
(8, 'Simulations'),
(9, 'Animations');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emociones`
--

CREATE TABLE `emociones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `peso` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `emociones`
--

INSERT INTO `emociones` (`id`, `nombre`, `peso`) VALUES
(1, 'Anger', 1),
(2, 'Comptent', 1),
(3, 'Disgust', 1),
(4, 'Fear', 1),
(5, 'Joy', 1),
(6, 'Sadness', 1),
(7, 'Surprise', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `similitudes`
--

CREATE TABLE `similitudes` (
  `id` int(11) NOT NULL,
  `idVideo1` int(11) NOT NULL,
  `idVideo2` int(11) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombreCompleto` varchar(150) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombreCompleto`, `fechaNacimiento`, `correo`, `password`, `pais`) VALUES
(1, 'Pedro Perez', '2000-05-16', 'pp@gmail.com', 'pedroperez', 'Colombia'),
(2, 'Gustavo Petro', '1960-04-19', 'petro@gmail.com', 'petro', 'Colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_has_categorias`
--

CREATE TABLE `usuarios_has_categorias` (
  `id` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_has_categorias`
--

INSERT INTO `usuarios_has_categorias` (`id`, `idCategoria`, `idUsuario`) VALUES
(1, 3, 2),
(2, 4, 2),
(3, 7, 2),
(4, 8, 1),
(5, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_has_emociones`
--

CREATE TABLE `usuarios_has_emociones` (
  `id` int(11) NOT NULL,
  `idEmocion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idVideo` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_has_emociones`
--

INSERT INTO `usuarios_has_emociones` (`id`, `idEmocion`, `idUsuario`, `idVideo`, `fecha`) VALUES
(1, 1, 1, 1, '2018-05-01'),
(3, 2, 2, 2, '2018-05-15'),
(4, 5, 1, 2, '2018-05-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(400) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `puntuacion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `videos`
--

INSERT INTO `videos` (`id`, `nombre`, `descripcion`, `puntuacion`) VALUES
(1, 'Frog Disection', 'Video description 1', 3.5),
(2, 'RSA Animate: Changing Education', 'Video description 2', 4.2),
(3, 'Animated Education 2', 'Description Video 3', 4.4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos_has_categorias`
--

CREATE TABLE `videos_has_categorias` (
  `id` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idVideo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `videos_has_categorias`
--

INSERT INTO `videos_has_categorias` (`id`, `idCategoria`, `idVideo`) VALUES
(1, 9, 2),
(2, 8, 1),
(3, 9, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `emociones`
--
ALTER TABLE `emociones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `similitudes`
--
ALTER TABLE `similitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios_has_categorias`
--
ALTER TABLE `usuarios_has_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios_has_emociones`
--
ALTER TABLE `usuarios_has_emociones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videos_has_categorias`
--
ALTER TABLE `videos_has_categorias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `emociones`
--
ALTER TABLE `emociones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `similitudes`
--
ALTER TABLE `similitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios_has_categorias`
--
ALTER TABLE `usuarios_has_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios_has_emociones`
--
ALTER TABLE `usuarios_has_emociones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `videos_has_categorias`
--
ALTER TABLE `videos_has_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

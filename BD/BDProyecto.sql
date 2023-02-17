

create database proyecto;
use proyecto;

CREATE TABLE `ubicacion` (
  `idUbicacion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idUbicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vehiculo` (
  `idVehiculo` int NOT NULL AUTO_INCREMENT,
  `tipoVehiculo` varchar(45) NOT NULL,
  `posiciones` int NOT NULL,
  PRIMARY KEY (`idvehiculo`),
  UNIQUE KEY `tipoVehiculo_UNIQUE` (`tipoVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `inventario` (
  `idInventario` int NOT NULL AUTO_INCREMENT,
  `fechaIngreso` date NOT NULL,
  `condicion` nvarchar(6) NOT NULL DEFAULT 'NUEVA, R1,R2, PR1, PR2',
  `dot` varchar(20) not null,
  `dimension` nvarchar(10) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `diseño` varchar(10) NOT NULL,
  `costo` float NOT NULL,
  `estado` nvarchar(2) not null DEFAULT 'I, S,',
  `profundidadInicial` float not null,
  `id_Ubicacion` int NOT NULL,
  PRIMARY KEY (`idInventario`),
  KEY `FK_Ubicacion_idx` (`idUbicacion`),
  CONSTRAINT `FK_Ubicacion` FOREIGN KEY (`id_Ubicacion`) REFERENCES `ubicacion` (`idUbicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `matricula` (
  `idMatricula` int NOT NULL AUTO_INCREMENT,
  `quemado` int  not null,
  `fecha` date NOT NULL,
  `noPosicion` int NOT NULL,
  `destino` varchar(45) NOT NULL,
  `kmInicial` float NOT NULL,
  `id_Inventario` int NOT NULL,
  `id_Vehiculo` int NOT NULL,
  PRIMARY KEY (`idMatricula`),
  KEY `FK_IdVehiculo_idx` (`id_Vehiculo`),
  KEY `FK_IdInventario_idx` (`id_Inventario`),
  CONSTRAINT `FK_IdInventario` FOREIGN KEY (`id_Inventario`) REFERENCES `inventario` (`idInventario`),
  CONSTRAINT `FK_IdVehiculo` FOREIGN KEY (`id_Vehiculo`) REFERENCES `vehiculo` (`idVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cambio` (
  `idCambio` int NOT NULL AUTO_INCREMENT,
  `kmActualC` float NOT NULL,
  `detalle` varchar(200) NOT NULL,
  `id_Matricula` int NOT NULL,
  PRIMARY KEY (`idCambio`),
  KEY `FK_Matricula_idx` (`id_Matricula`),
  CONSTRAINT `FK_Matricula` FOREIGN KEY (`id_Matricula`) REFERENCES `matricula` (`idMatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `registro` (
  `idRegistro` int NOT NULL AUTO_INCREMENT,
  `kmActualR` float NOT NULL,
  `profundidadActual` float,
  `tapones` varchar(2) NOT NULL,
  `recorridoA`float null,
  `cpk` float  null,
  `id_Matricula` int NOT NULL,
  PRIMARY KEY (`idCambio`),
  KEY `FK_Matricula_idx` (`id_Matricula`),
  CONSTRAINT `FK_Matricula` FOREIGN KEY (`id_Matricula`) REFERENCES `matricula` (`idMatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



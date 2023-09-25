CREATE DATABASE veterinaria;

USE veterinaria;

CREATE TABLE Animales
(
	idAnimal 		INT 	AUTO_INCREMENT PRIMARY KEY,
	nombreAnimal	VARCHAR(30) NOT NULL,
	create_at 		DATETIME 	NOT NULL DEFAULT NOW(),
	update_at 		DATETIME 	NULL,
	estado			CHAR(1) 		NOT NULL DEFAULT '1',
	CONSTRAINT uk_nombreanimal_ani UNIQUE(nombreAnimal)
)ENGINE = INNODB;

CREATE TABLE Razas
(
	idRaza			INT AUTO_INCREMENT PRIMARY KEY,
	nombreRaza		VARCHAR(50) NOT NULL,
	idAnimal 		INT 			NOT NULL,
	create_at 		DATETIME 	NOT NULL DEFAULT NOW(),
	update_at 		DATETIME 	NULL,
	estado			CHAR(1) 		NOT NULL DEFAULT '1',
	CONSTRAINT fk_id_raz	FOREIGN KEY (idAnimal) REFERENCES Animales (idAnimal),
	CONSTRAINT fk_nombreRaza_raz	UNIQUE (nombreRaza)
)ENGINE = INNODB;

CREATE TABLE Clientes
(
	idCliente		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos		VARCHAR(30) NOT NULL,
	nombres			VARCHAR(30) NOT NULL,
	dni				CHAR(8)		NOT NULL,
	claveAcceso		VARCHAR(200)NOT NULL,
	create_at 		DATETIME 	NOT NULL DEFAULT NOW(),
	update_at 		DATETIME 	NULL,
	estado			CHAR(1) 		NOT NULL DEFAULT '1',
	CONSTRAINT uk_dni_cli UNIQUE(dni)
)ENGINE = INNODB;

CREATE TABLE Mascotas
(
	idMascota		INT AUTO_INCREMENT PRIMARY KEY,
	nombre			VARCHAR(30) 	NOT NULL,
	fotografia		VARCHAR(100)	NULL,
	color				VARCHAR(30)		NOT NULL,
	genero			CHAR(1)			NOT NULL,
	idCliente 		INT 				NOT NULL,
	idRaza			INT 				NOT NULL,
	CONSTRAINT fk_idcl_maz	FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente),
	CONSTRAINT fk_idrz_maz	FOREIGN KEY (idRaza) REFERENCES Razas (idRaza)
)ENGINE = INNODB;

-- data
INSERT INTO Animales(nombreAnimal) VALUES
('Perro'),
('Gato');

INSERT INTO Razas (idAnimal, nombreRaza) VALUES
(1, 'Schnauser'),
(1, 'Dalmata'),
(1, 'American Bully'),
(1, 'Pastor aleman'),
(1, 'Pit bull'),
(1, 'Mestizo'),
(2, 'Chinchilla'),
(2, 'Devon Rex'),
(2, 'Korat'),
(2, 'Oriental de pelo largo'),
(2, 'Ragdoll'),
(2, 'Ocigato');

INSERT INTO Clientes(apellidos, nombres, dni, claveAcceso) VALUES
('Luque Ramos', 'Johan Alberto', '71789712', '12345'),
('Quispe Acevedo', 'Piero', '12345678', '12345'),
('Polo Andrade', 'Andy Smith', '12345677', '12345'),
('Corzo Carbajal', 'Aldo Alfredo', '12345666', '12345');

INSERT INTO Mascotas(nombre, fotografia, color, genero, idCliente, idRaza) VALUES
('Carrizo', 'perro1.jpg', 'Negro y Rubio', 'H', 1,4),
('Blanca', 'perro2.jpg', 'Blanco', 'H', 1,6),
('Conejo', 'gato2.jpg', 'Rubio', 'M', 2,8),
('sofi', 'oerro1.jpg', 'Rubio', 'H', 2,3),
('Garfield', 'gato3.jpg', 'Rubio', 'M', 2,12);

SELECT * FROM Animales;
SELECT * FROM Razas;
SELECT * FROM Clientes;
SELECT * FROM Mascotas;

UPDATE clientes SET claveAcceso = "$2y$10$Cnti6nMp5glSTbDRJy9bAOHWeYXI5uRSvEcKnKFMA8qU2D6jJFNCW";

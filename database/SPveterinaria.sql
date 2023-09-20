USE veterinaria;

DELIMITER $$
CREATE PROCEDURE spu_registrar_clientes
(
IN _apellidos		VARCHAR(30),
IN _nombres			VARCHAR(30),
IN _dni				CHAR(8),
IN _claveAcceso	VARCHAR(200)
)
BEGIN
	INSERT INTO Clientes(apellidos, nombres, dni, claveAcceso) VALUES
	(_apellidos, _nombres, _dni, _claveAcceso);
END $$

DELIMITER $$
CREATE PROCEDURE spu_registrar_mascotas
(
IN _nombre 		VARCHAR(30),
IN _fotografia VARCHAR(200),
IN _color		VARCHAR(30),
IN _genero		CHAR(1),
IN _idCliente 	INT,
IN _idRaza		INT 
)
BEGIN
	IF _fotografia = '' THEN SET _fotografia = NULL; END IF;
	
	INSERT INTO Mascotas(nombre, fotografia, color, genero, idCliente, idRaza) VALUES
	(_nombre, _fotografia, _color, _genero, _idCliente, _idRaza);
END $$

DELIMITER $$
CREATE PROCEDURE spu_buscar_clientes
(
IN _dni CHAR(8)
)
BEGIN 
	SELECT Mascotas.nombre, Mascotas.color, Mascotas.genero, razas.nombreRaza, animales.nombreAnimal
	FROM Mascotas
	INNER JOIN Clientes ON Mascotas.idCliente = Clientes.idCliente
	INNER JOIN Razas ON Mascotas.idRaza = Razas.idRaza
	INNER JOIN Animales ON Razas.idAnimal = Animales.idAnimal
	WHERE clientes.dni = _dni;
END $$

DELIMITER $$
CREATE PROCEDURE spu_search_mascotas
(
IN _idMascota	INT 
)
BEGIN
	SELECT clientes. Animales.nombreAnimal, razas.nombreRaza, Mascotas.fotografia, Mascotas.nombre, Mascotas.color, Mascotas.genero 
	FROM Mascotas
	INNER JOIN Clientes ON Mascotas.idCliente = Clientes.idCliente
	INNER JOIN Razas ON Mascotas.idRaza = Razas.idRaza
	INNER JOIN Animales ON Razas.idAnimal = Animales.idAnimal
	WHERE Mascotas.idMascota =  _idMascota;
END $$

DELIMITER $$
CREATE PROCEDURE spu_login_clientes
(
IN _dni CHAR(8)
)
BEGIN
	SELECT *
	FROM clientes
	WHERE dni = _dni;
END $$
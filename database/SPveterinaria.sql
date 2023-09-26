 USE veterinaria;

DELIMITER $$
CREATE PROCEDURE spu_registrar_clientes
(
IN _apellidos			VARCHAR(30),
IN _nombres			VARCHAR(30),
IN _dni				CHAR(8),
IN _claveAcceso			VARCHAR(200)
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
	IN _idmascota 	INT
)
BEGIN
	SELECT mascotas.idmascota,mascotas.nombre,razas.nombreRaza,animales.nombreAnimal, mascotas.fotografia ,mascotas.color, mascotas.genero
	FROM mascotas
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	INNER JOIN animales ON animales.idanimal = razas.idanimal
	WHERE mascotas.idmascota = _idmascota;
END $$

DELIMITER $$
CREATE PROCEDURE spu_listar_mascotas
(
	IN _idcliente 	INT
)
BEGIN
	SELECT mascotas.idmascota,clientes.nombres, clientes.apellidos, mascotas.nombre, mascotas.color, mascotas.genero
	FROM mascotas
	INNER JOIN clientes ON clientes.idcliente = mascotas.idcliente
	INNER JOIN razas ON razas.idraza = mascotas.idraza
	WHERE mascotas.idcliente = _idcliente;
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

DELIMITER $$
CREATE PROCEDURE spu_listar_Animal()
BEGIN 
	SELECT idAnimal, nombreAnimal 
	FROM animales;
END $$

 DELIMITER $$
CREATE PROCEDURE spu_listar_razas( IN _id INT)
BEGIN
	SELECT idraza, 
	nombreRaza 
	FROM razas
	WHERE idanimal = _id;
END $$

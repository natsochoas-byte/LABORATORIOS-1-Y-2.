--LABORATORIO 3-PRIVACIDAD, CUMPLIMIENTO Y GOBIERNO DE LOS DATOS
--Actividad 2 — Principio de minimización
--Supongamos que el área de atención al cliente solicita crear una nueva tabla:
CREATE TABLE clientes_soporte (
    id BIGSERIAL,
    nombre VARCHAR(120),
    correo VARCHAR(150),
    telefono VARCHAR(20),
    rfc VARCHAR(13),
    edad INTEGER,
    ciudad VARCHAR(80),
    codigo_postal VARCHAR(10),
    fecha_alta DATE
);

SELECT * FROM clientes_soporte;

--Diseñar una estructura mínima
--Crea una tabla que contenga únicamente los datos necesarios para la finalidad de soporte:
CREATE TABLE clientes_soporte (
    id BIGINT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    telefono VARCHAR(20)
);

--Cargar información a partir de clientes:
INSERT INTO clientes_soporte (
    id,
    nombre,
    correo,
    telefono
)
SELECT
    id,
    nombre,
    correo,
    telefono
FROM clientes;

--Consultamos
SELECT * FROM clientes_soporte;
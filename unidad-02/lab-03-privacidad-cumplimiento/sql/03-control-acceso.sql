--CONTROL DE ACCESOS
--Actividad 6 — Derechos ARCO y la base de datos
--Supongamos que un titular solicita conocer los datos personales
--que la organización tiene registrados.
--Identifica qué consulta permitiría localizar su información.
SELECT
    id,
    nombre,
    correo,
    telefono,
    rfc,
    edad,
    ciudad,
    codigo_postal,
    fecha_alta
FROM clientes
WHERE correo = 'ana@example.com';

--Actividad 7 — Derecho de rectificación
--Supongamos que un cliente informa:
--Actualiza únicamente el dato correspondiente:
UPDATE clientes
SET correo = 'nuevo-correo@example.com'
WHERE id = 1;

--verificamos:
SELECT
    id,
    nombre,
    correo
FROM clientes
WHERE id = 1;
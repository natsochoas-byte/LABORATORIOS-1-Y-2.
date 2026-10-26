--LABORATORIO 4- HARDENING
--Natalia Ochoa León 4-1
--Actividad 1 — Identificar la superficie de ataque
--Objetivo:Identificar los principales puntos de exposición del servidor PostgreSQL.
SELECT version();

--Puerto de PostgreSQL
SHOW port;

--Interfaces de escucha
SHOW listen_addresses;

-- Estado de SSL
SHOW ssl;

-- Metodo de almacenamiento de nuevas contrasenas
SHOW password_encryption;

-- Conexiones actuales
SELECT
pid,
usename,
datname,
client_addr,
client_port,
application_name
FROM pg_stat_activity
ORDER BY pid;

--Actividad 2 — Identificar los archivos de configuración
--Consulta:
SHOW config_file;
SHOW hba_file;
SHOW ident_file;
 --Otros parametros importantes
SHOW data_directory;
SHOW log_directory;
SHOW log_connections;
SHOW log_disconnections;

--Actividad 3 — Revisar listen_addresses
SHOW listen_addresses;

--Actividad 4 — Revisar pg_hba.conf
--Consulta las reglas configuradas:
SELECT
    type,
    database,
    user_name,
    address,
    auth_method
FROM pg_hba_file_rules;

--Actividad 5 — Analizar una regla permisiva
-- Actividad 5: Revisar la configuracion de autenticacion
SHOW hba_file;

--Actividad 7 — Revisar autenticación
--COnsulta
SHOW password_encryption;


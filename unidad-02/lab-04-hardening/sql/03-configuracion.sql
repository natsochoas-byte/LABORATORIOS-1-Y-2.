--CONFIGURACION
---- Actividad 10: Revisar extensiones instaladas
SELECT
    extname,
    extversion
FROM pg_extension
ORDER BY extname;

---- Actividad 11:Revisar configuración relacionada con conexiones
--Consulta:
SHOW max_connections;

SHOW superuser_reserved_connections;

SHOW statement_timeout;

SHOW idle_in_transaction_session_timeout;

--Actividad 12 — Revisar permisos del sistema operativo
SHOW data_directory;

-- Actividad 15: Verificar TLS

SHOW ssl;

SHOW ssl_min_protocol_version;

SELECT
    pid,
    ssl,
    version,
    cipher
FROM pg_stat_ssl
WHERE pid = pg_backend_pid();
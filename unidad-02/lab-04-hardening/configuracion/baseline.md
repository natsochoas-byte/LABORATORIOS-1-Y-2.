## BASELINE

## Actividad 1 — Superficie de ataque inicial

### Información del entorno

| Elemento | Resultado |
|---|---|
| Sistema operativo | Ubuntu 24.04.4 LTS |
| Versión de PostgreSQL | 16.15 |
| Puerto | 5432 |
| Interfaces de escucha | `localhost` |
| SSL | `on` |
| Método de almacenamiento de contraseñas | `scram-sha-256` |

La inspección permitió identificar la versión del servidor, el puerto utilizado, las interfaces de escucha, el estado de SSL, el método de almacenamiento de contraseñas y las conexiones activas.

Conocer la superficie de ataque permite identificar los servicios, las conexiones, los usuarios y las configuraciones activas antes de realizar cambios. Esto ayuda a detectar riesgos y determinar qué elementos deben restringirse sin afectar el funcionamiento del servidor.

## Actividad 2 — Archivos de configuración

Se consultaron los parámetros que permiten localizar los archivos principales de configuración de PostgreSQL.

| Archivo o parámetro | Ubicación o función |
|---|---|
| `postgresql.conf` | `/etc/postgresql/16/main/postgresql.conf` |
| `pg_hba.conf` | `/etc/postgresql/16/main/pg_hba.conf` |
| `data_directory` | `/var/lib/postgresql/16/main` |
| `ident_file` | Ubicación consultada mediante `SHOW ident_file`. |
| `log_directory` | Directorio de registros consultado mediante `SHOW log_directory`. |

Estos archivos permiten identificar dónde se definen los parámetros del servidor, las reglas de autenticación y otros elementos relacionados con su funcionamiento. Los valores de `ident_file` y `log_directory` deben conservarse según los resultados obtenidos en la consulta.

## Actividad 3 — Interfaces de escucha

El resultado de `SHOW listen_addresses` fue:

```text
localhost
```

Esto indica que PostgreSQL está configurado para escuchar en las interfaces locales. Esta configuración limita la exposición directa del servicio frente a equipos de otras redes.

## Actividad 4 — Conexiones activas

Se consultó `pg_stat_activity` para identificar las conexiones activas al servidor.

Entre los resultados observados se encontraron conexiones de PostgreSQL, `psql` y pgAdmin 4. También se observaron conexiones locales desde `127.0.0.1`.

Esta revisión permite conocer qué usuarios están conectados, qué bases de datos utilizan y desde qué direcciones se establecen las conexiones.

## Actividad 7 — Autenticación y protección de contraseñas

El resultado de `SHOW password_encryption` fue:

```text
scram-sha-256
```

### Diferencia entre autenticación y autorización

La autenticación comprueba la identidad de quien intenta conectarse a PostgreSQL. La autorización determina qué operaciones puede realizar una vez que obtiene acceso.

### ¿Qué protege SCRAM-SHA-256?

SCRAM-SHA-256 es un mecanismo de autenticación que permite verificar contraseñas sin transmitirlas directamente como texto plano durante el proceso de autenticación. PostgreSQL también lo utiliza como método de almacenamiento de nuevas contraseñas mediante el parámetro `password_encryption`.

### ¿Por qué un hash no es reversible como el cifrado?

Un hash transforma la contraseña en un valor que no está diseñado para recuperar directamente el texto original. El cifrado reversible, en cambio, permite recuperar los datos originales mediante la clave correspondiente.

### ¿Qué sucede si una cuenta tiene demasiados privilegios?

Aunque la contraseña sea segura, una cuenta con permisos excesivos puede provocar daños importantes si sus credenciales son robadas o la cuenta es comprometida. Por eso, los privilegios deben limitarse a las tareas necesarias.

## Actividad 8 — Roles y privilegios

Se consultó `pg_roles` para revisar los atributos de los roles, incluyendo:

- Nombre del rol.
- Privilegios de superusuario.
- Herencia de privilegios.
- Capacidad para crear roles.
- Capacidad para crear bases de datos.
- Permiso para iniciar sesión.

También se identificó el usuario `postgres` entre las conexiones activas.

La revisión de roles permite identificar las cuentas privilegiadas y evaluar si los permisos asignados corresponden con las funciones de cada usuario.

## Actividad 10 — Extensiones instaladas

La consulta a `pg_extension` devolvió los siguientes resultados:

| Extensión | Versión | Función |
|---|---|---|
| `pgcrypto` | 1.3 | Proporciona funciones criptográficas. |
| `plpgsql` | 1.0 | Permite utilizar el lenguaje procedural PL/pgSQL. |

Las extensiones deben revisarse para determinar cuáles son necesarias y evitar mantener componentes que no se utilizan.

## Actividad 11 — Parámetros de conexión

Los resultados obtenidos fueron:

| Parámetro | Valor |
|---|---:|
| `max_connections` | 100 |
| `superuser_reserved_connections` | 3 |
| `statement_timeout` | 0 |
| `idle_in_transaction_session_timeout` | 0 |

`max_connections` establece el máximo de conexiones simultáneas configuradas. `superuser_reserved_connections` reserva conexiones para superusuarios.

Los valores `0` de los parámetros de tiempo de espera indican que no se aplica un límite mediante esos parámetros. Conviene evaluar si se requieren límites según las necesidades de la aplicación y del servidor.

## Actividad 12 — Permisos del sistema operativo

Se revisaron los permisos del directorio de datos y de los archivos de configuración.

| Elemento | Permisos | Propietario |
|---|---|---|
| `/var/lib/postgresql/16/main` | `700` | `postgres:postgres` |
| `/etc/postgresql/16/main/pg_hba.conf` | `640` | `postgres:postgres` |
| `/etc/postgresql/16/main/postgresql.conf` | `644` | `postgres:postgres` |

El directorio de datos tiene permisos restrictivos. El archivo `pg_hba.conf` permite lectura al propietario y al grupo, mientras que `postgresql.conf` permite lectura a otros usuarios locales.

Los permisos deben mantenerse de forma que solo las cuentas autorizadas puedan modificar los archivos y acceder a los datos sensibles.

## Actividad 13 — Exposición de red

Se utilizó el comando `ss -lnt` para revisar los puertos en escucha del sistema.

El resultado mostró PostgreSQL escuchando en:

```text
127.0.0.1:5432
```

Esta dirección corresponde a la interfaz local IPv4. Por lo tanto, el servicio no aparece escuchando en todas las interfaces IPv4 según el resultado observado.

La revisión de puertos permite identificar servicios disponibles y evaluar si su exposición corresponde con las necesidades del sistema.

## Actividad 14 — Estado del firewall

El resultado de `sudo ufw status` fue:

```text
Estado: inactivo
```

Esto indica que UFW no está aplicando sus propias reglas de filtrado. Sin embargo, este resultado no permite concluir que no existan otros mecanismos de filtrado o protección de red.

El estado del firewall debe considerarse junto con las interfaces de escucha y las reglas de autenticación de PostgreSQL.

## Actividad 15 — Configuración TLS

Los resultados obtenidos fueron:

| Control | Resultado |
|---|---|
| `ssl` | `on` |
| `ssl_min_protocol_version` | `TLSv1.2` |
| Versión TLS de la conexión verificada | `TLSv1.3` |
| Cifrado observado | `TLS_AES_256_GCM_SHA384` |

SSL está habilitado y la versión mínima configurada es TLS 1.2. La conexión inspeccionada utilizó TLS 1.3.

TLS protege la información transmitida entre el cliente y el servidor cuando la conexión está cifrada. Su configuración debe acompañarse de una verificación de las conexiones y de los requisitos de seguridad de los clientes.

## Actividad 16 — Comparación de configuración antes y después

| Control | Antes | Después | Justificación |
|---|---|---|---|
| `listen_addresses` | `localhost` | Mantener `localhost` si solo se requieren conexiones locales. | Evitar exposición innecesaria en otras interfaces. |
| `pg_hba.conf` | Archivo revisado; reglas por evaluar según los accesos necesarios. | Restringir las reglas a usuarios, bases de datos y orígenes autorizados. | Reducir intentos de conexión no autorizados. |
| Método de autenticación | `password_encryption = scram-sha-256`; los métodos de las reglas deben evaluarse por separado. | Utilizar métodos seguros, como SCRAM-SHA-256, cuando sean compatibles. | Proteger las credenciales. |
| Usuarios administrativos | Se identificó `postgres` entre las conexiones activas. | Limitar las cuentas administrativas a las tareas autorizadas. | Reducir el impacto de una cuenta comprometida. |
| Cuentas de aplicación | Se observó `natalia_ochoa` en conexiones de pgAdmin; su función y privilegios deben evaluarse. | Utilizar cuentas específicas para las aplicaciones. | Evitar permisos administrativos innecesarios. |
| Puerto | `5432` | Mantener `5432` si no existe una razón justificada para cambiarlo. | Cambiar el puerto no es suficiente para proteger el servicio. |
| TLS | SSL habilitado; mínimo TLS 1.2 y conexión verificada con TLS 1.3. | Mantener TLS habilitado y verificar las conexiones pertinentes. | Proteger la información transmitida. |
| Permisos del sistema operativo | Directorio de datos `700`, `pg_hba.conf` `640` y `postgresql.conf` `644`. | Mantener permisos restrictivos y revisar los accesos. | Evitar modificaciones y accesos no autorizados. |
| Extensiones | `pgcrypto` 1.3 y `plpgsql` 1.0. | Conservar las extensiones necesarias. | Evitar componentes innecesarios. |
| Conexiones | `max_connections = 100`; `superuser_reserved_connections = 3`; UFW inactivo. | Evaluar los límites de conexión y restringir el acceso de red según las necesidades. | Controlar el consumo de recursos y la exposición del servicio. |

## Conclusión

La inspección permitió conocer la configuración inicial de PostgreSQL 16, incluyendo sus interfaces de escucha, conexiones, autenticación, roles, extensiones, parámetros, permisos del sistema operativo y uso de TLS.

Entre los controles observados se encuentran la escucha en `localhost`, el uso de SCRAM-SHA-256 para nuevas contraseñas y SSL habilitado. También se identificaron aspectos que deben evaluarse, como las reglas de `pg_hba.conf`, los privilegios de los roles, los tiempos de espera y el estado del firewall.

Esta línea base sirve como referencia para documentar la configuración inicial y comparar posteriormente los controles que se decida aplicar para reforzar la seguridad del servidor.
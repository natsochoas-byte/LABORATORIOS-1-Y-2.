## CAMBIOS

## Actividad 6 — Restricción de reglas de autenticación

Las reglas de `pg_hba.conf` deben permitir únicamente las conexiones necesarias para el funcionamiento del servidor.

Se propone:

- Restringir las conexiones según la base de datos y el usuario.
- Autorizar únicamente las direcciones IP o redes que necesiten acceder al servidor.
- Evitar reglas generales que permitan conexiones desde cualquier origen sin una justificación.
- Utilizar métodos seguros de autenticación.
- Revisar las reglas después de cada modificación y comprobar que las conexiones autorizadas continúen funcionando.

## Actividad 9 — Separación de cuentas

| Cuenta | Propósito | LOGIN | Privilegios |
|---|---|---|---|
| DBA | Administrar el servidor y las bases de datos. | Sí | Privilegios administrativos únicamente para las tareas autorizadas. |
| APP | Permitir que la aplicación se conecte a la base de datos. | Sí | Permisos mínimos necesarios para el funcionamiento de la aplicación. |
| CONSULTA | Consultar información autorizada. | Sí | Solo lectura sobre las tablas necesarias. |

Utilizar una cuenta administrativa en una aplicación representa un riesgo porque una vulnerabilidad o una filtración de credenciales podría permitir realizar operaciones administrativas, modificar información o eliminar datos. Por ello, se propone separar las cuentas y aplicar el principio de mínimo privilegio.

## Actividad 17 — Checklist de hardening

| # | Control | Verificado | Evidencia |
|---:|---|---|---|
| 1 | Puerto documentado | Sí | Consulta `SHOW port`; resultado `5432`. |
| 2 | Interfaces de escucha revisadas | Sí | Consulta `SHOW listen_addresses`; resultado `localhost`. |
| 3 | `pg_hba.conf` revisado | Sí | Revisión del archivo de autenticación. |
| 4 | Redes autorizadas restringidas | Pendiente de comprobar | Revisión de las reglas de `pg_hba.conf`. |
| 5 | Autenticación segura | Parcial | `password_encryption = scram-sha-256`; revisión de los métodos de autenticación de `pg_hba.conf`. |
| 6 | Cuentas administrativas identificadas | Parcial | Consulta de roles y conexiones activas. |
| 7 | Cuentas de aplicación separadas | Propuesta documentada | Tabla de separación de cuentas de la Actividad 9. |
| 8 | Privilegios mínimos | Pendiente de comprobar | Revisión de los privilegios de cada rol. |
| 9 | Extensiones revisadas | Sí | Consulta a `pg_extension`; `pgcrypto` 1.3 y `plpgsql` 1.0. |
| 10 | TLS verificado | Sí | Conexión comprobada con TLS 1.3. |
| 11 | Archivos de configuración revisados | Sí | Comprobación de permisos de `postgresql.conf` y `pg_hba.conf`. |
| 12 | Directorio de datos protegido | Sí | Directorio con permisos `700` y propietario `postgres`. |
| 13 | Firewall documentado | Sí | UFW aparece inactivo. |
| 14 | Actualizaciones documentadas | Pendiente de comprobar | Revisión del estado de actualizaciones de PostgreSQL y Ubuntu. |
| 15 | Configuración registrada | Sí | Tabla de comparación de la Actividad 16. |
| 16 | Conexiones revisadas | Sí | Consulta a `pg_stat_activity`. |
| 17 | Parámetros de conexión revisados | Sí | Consultas de límites y tiempos de espera. |
| 18 | Versión mínima de TLS revisada | Sí | `ssl_min_protocol_version = TLSv1.2`. |

## Actividad 18 — Caso integral

| # | Problema | Riesgo | Control propuesto |
|---:|---|---|---|
| 1 | PostgreSQL acepta conexiones desde cualquier dirección IPv4. | Equipos no autorizados pueden intentar conectarse. | Restringir las conexiones a direcciones y redes autorizadas. |
| 2 | El servidor escucha en todas las interfaces. | El servicio queda expuesto a redes innecesarias. | Configurar `listen_addresses` con las interfaces requeridas. |
| 3 | El firewall permite el puerto `5432` desde cualquier origen. | Aumentan los intentos de conexión y los posibles ataques externos. | Permitir el acceso al puerto solo desde orígenes autorizados. |
| 4 | `pg_hba.conf` permite `all/all` desde `0.0.0.0/0`. | Cualquier origen IPv4 puede intentar autenticarse para los usuarios y bases de datos contemplados por esa regla. | Restringir las reglas por base de datos, usuario, origen y método de autenticación. |
| 5 | La aplicación utiliza una cuenta administrativa. | Una vulnerabilidad podría permitir realizar operaciones administrativas. | Crear una cuenta exclusiva para la aplicación con privilegios mínimos. |
| 6 | No se separan las cuentas administrativas y de aplicación. | El compromiso de la aplicación puede afectar otros recursos de la base de datos. | Separar los roles de administración, aplicación y consulta. |
| 7 | Se confía únicamente en contraseñas fuertes. | Las credenciales pueden filtrarse o ser utilizadas en ataques. | Combinar contraseñas seguras con autenticación adecuada, restricciones de red y monitoreo. |
| 8 | No se limita el origen de las conexiones. | Se permiten intentos de acceso desde redes no autorizadas. | Restringir el origen de las conexiones mediante reglas de red y `pg_hba.conf`. |
| 9 | No se especifica la verificación de TLS. | Las conexiones sin cifrado podrían exponer información transmitida. | Configurar y verificar TLS en las conexiones pertinentes. |
| 10 | No se mencionan registros ni monitoreo. | Los intentos de acceso sospechosos pueden pasar inadvertidos. | Registrar y revisar las conexiones y la actividad del servidor. |
| 11 | No se especifican límites de privilegios para la aplicación. | La aplicación podría modificar o eliminar información innecesariamente. | Conceder únicamente los permisos necesarios para sus funciones. |
| 12 | No se mencionan controles de acceso a los archivos del servidor. | Los permisos inadecuados pueden exponer archivos sensibles. | Proteger los archivos de configuración y el directorio de datos mediante permisos restrictivos. |

### ¿Es suficiente tener contraseñas fuertes?

No. Las contraseñas fuertes ayudan a proteger la autenticación, pero no garantizan por sí solas la seguridad de PostgreSQL.

- **Autenticación:** comprobar la identidad de quien intenta conectarse.
- **Autorización:** limitar las operaciones que cada usuario puede realizar.
- **Red:** restringir las interfaces, los orígenes autorizados y el acceso al puerto.
- **Configuración:** revisar las reglas de autenticación y los parámetros de seguridad.
- **Sistema operativo:** proteger los archivos, los directorios y los permisos de acceso.
- **Monitoreo:** registrar y revisar la actividad para detectar posibles incidentes.

La seguridad requiere que estos controles trabajen conjuntamente.

## Actividad 19 — Línea base de seguridad para PostgreSQL 16

### 1. Red

- **Interfaces autorizadas:** mantener `listen_addresses = 'localhost'` si solo se requieren conexiones locales. Si se necesitan conexiones remotas, autorizar únicamente las interfaces necesarias.
- **Puerto:** mantener el puerto `5432`, salvo que exista una razón justificada para cambiarlo.
- **Firewall:** permitir conexiones al puerto de PostgreSQL únicamente desde los equipos y las redes autorizados.
- **Redes permitidas:** restringir los orígenes mediante reglas específicas en `pg_hba.conf`, evitando permisos generales innecesarios.

### 2. Autenticación

- **Método:** utilizar SCRAM-SHA-256 para la autenticación mediante contraseña cuando los clientes sean compatibles.
- **Políticas de credenciales:** establecer contraseñas largas, únicas y difíciles de adivinar; evitar compartirlas y almacenarlas en texto plano.
- **Cuentas administrativas:** limitar el uso de `postgres` y otras cuentas privilegiadas a las tareas administrativas autorizadas.

### 3. Autorización

- **Roles:** separar los roles administrativos, de aplicación y de consulta.
- **Privilegios:** aplicar el principio de mínimo privilegio.
- **Cuentas de aplicación:** utilizar cuentas específicas sin privilegios de superusuario y con permisos limitados a las operaciones necesarias.

### 4. Configuración

- **Parámetros relevantes:** revisar `listen_addresses`, `port`, `password_encryption`, `statement_timeout` e `idle_in_transaction_session_timeout`.
- **Extensiones:** conservar únicamente las extensiones necesarias y revisar su mantenimiento.
- **Conexiones:** establecer límites adecuados para `max_connections` y revisar periódicamente las conexiones activas.

### 5. Sistema operativo

- **Propietario de archivos:** mantener los archivos y directorios de PostgreSQL bajo las cuentas administrativas correspondientes.
- **Permisos:** restringir la lectura y modificación de archivos de configuración a los usuarios que lo necesiten.
- **Directorio de datos:** proteger `/var/lib/postgresql/16/main` y permitir el acceso únicamente a las cuentas autorizadas.

### 6. Cifrado

- **TLS:** mantener SSL habilitado y verificar el uso de TLS en las conexiones pertinentes.
- **Protección de credenciales:** utilizar mecanismos seguros para almacenar contraseñas y evitar guardarlas en texto plano.
- **Información sensible:** limitar el acceso a datos personales y aplicar cifrado o enmascaramiento cuando corresponda.

### 7. Mantenimiento

- **Actualización:** instalar periódicamente las actualizaciones de seguridad de PostgreSQL y del sistema operativo.
- **Revisión periódica:** revisar las reglas de autenticación, los roles, los privilegios, las conexiones, los registros y la configuración de seguridad.
- **Documentación:** registrar los valores iniciales, los cambios aplicados, sus justificaciones y los resultados de las verificaciones.

## Registro de medidas propuestas

Las medidas de hardening se orientan a mantener el acceso de red limitado a las interfaces necesarias, revisar las reglas de autenticación, separar las cuentas administrativas y de aplicación, proteger los archivos del servidor y verificar el cifrado de las conexiones.

La aplicación de cada medida debe validarse mediante las consultas y comprobaciones correspondientes, confirmando que la seguridad mejore sin interrumpir el funcionamiento del servicio.

## Conclusión

La propuesta de hardening busca reducir la exposición de PostgreSQL 16 mediante el control de conexiones, la autenticación segura, la separación de roles, la protección del sistema operativo y la revisión periódica de la configuración.

La línea base y el checklist permiten organizar los controles, documentar los resultados y verificar las medidas que se apliquen, manteniendo un equilibrio entre seguridad, disponibilidad y continuidad del servicio.
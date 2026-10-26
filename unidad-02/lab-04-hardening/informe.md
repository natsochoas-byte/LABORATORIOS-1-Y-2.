# LAB04
# INFORME HARDENING
# NATALIA OCHOA LEÓN 4-1

1. ¿Cuál era la principal superficie de ataque?

La principal superficie de ataque estaba relacionada con las conexiones al servidor, las cuentas de usuario, los privilegios y las reglas de autenticación. PostgreSQL estaba configurado para escuchar en localhost, lo que limita su exposición directa a la red.

2. ¿Qué configuración representaba el mayor riesgo?

Un riesgo importante sería permitir conexiones desde orígenes no autorizados o asignar demasiados privilegios a las cuentas. También se identificó que UFW estaba inactivo, por lo que es necesario evaluar las medidas de protección de red existentes.

3. ¿Qué cambio produjo la mayor reducción de exposición?

Mantener listen_addresses = 'localhost' cuando solo se necesitan conexiones locales ayuda a reducir la exposición, ya que evita que PostgreSQL escuche en otras interfaces de red. Si se necesitan conexiones remotas, deben restringirse mediante reglas de acceso y controles de red.

4. ¿Qué diferencia existe entre firewall y pg_hba.conf?

El firewall controla el tráfico de red que puede entrar o salir del sistema. En cambio, pg_hba.conf define qué conexiones pueden autenticarse en PostgreSQL según el origen, el usuario, la base de datos y el método de autenticación.

5. ¿Qué diferencia existe entre autenticación y autorización?

La autenticación comprueba la identidad del usuario que intenta conectarse. La autorización determina qué acciones puede realizar dentro de PostgreSQL según los permisos que tenga asignados.

6. ¿Por qué una cuenta de aplicación no debe ser SUPERUSER?

Porque una cuenta con ese privilegio puede realizar prácticamente cualquier operación dentro del servidor. Si la aplicación o sus credenciales se ven comprometidas, el impacto sería mayor. Por eso, debe contar únicamente con los permisos necesarios para funcionar.

7. ¿Por qué cambiar el puerto de PostgreSQL no constituye hardening suficiente?

Porque cambiar el puerto no impide que una persona encuentre el servicio ni corrige los problemas de autenticación, permisos o exposición de red. La seguridad depende de aplicar varios controles y no solamente de modificar el puerto.

8. ¿Por qué listen_addresses='*' puede ser innecesario?

Porque permite que PostgreSQL escuche en todas las interfaces disponibles. Si solo se necesitan conexiones locales, esta configuración aumenta innecesariamente la exposición del servicio. Es preferible escuchar únicamente en las interfaces requeridas.

9. ¿Qué papel tiene el sistema operativo en la seguridad de PostgreSQL?

El sistema operativo protege los archivos de configuración, los datos y los procesos del servidor mediante permisos, propietarios, usuarios y controles de red. Si estos elementos no están bien configurados, la seguridad de PostgreSQL también puede verse afectada.

10. ¿Qué controles deberían revisarse periódicamente?

Se deberían revisar los roles y sus privilegios, las reglas de pg_hba.conf, las interfaces de escucha, el estado del firewall, la autenticación, la configuración TLS, los permisos de los archivos, las conexiones activas y los registros del servidor. También es importante mantener PostgreSQL actualizado.

31. Reflexión individual

Si recibiera la responsabilidad de asegurar un servidor PostgreSQL que ya está funcionando en producción, primero revisaría su exposición de red y las reglas de acceso para identificar quién puede conectarse y desde dónde.

Empezaría por este punto porque una configuración demasiado abierta puede permitir conexiones no autorizadas. Después revisaría los roles y privilegios, los métodos de autenticación, TLS y los permisos de los archivos del sistema.

Antes de aplicar cambios, verificaría qué aplicaciones utilizan el servidor y realizaría una copia de seguridad de la configuración. También probaría las modificaciones para evitar interrumpir el servicio, ya que la disponibilidad y la continuidad son importantes en producción.

Priorizaría reducir la exposición y corregir los accesos innecesarios porque esto puede disminuir el riesgo sin tener que modificar de inmediato el funcionamiento de las aplicaciones. Los cambios se aplicarían de forma controlada, verificando que los usuarios autorizados puedan seguir conectándose y que los controles de seguridad funcionen correctamente.
# EVIDENCIAS

## Actividad 11 — Diseñar una matriz de gobierno de datos

### Objetivo
Definir para qué se utiliza cada dato de los clientes, quién puede acceder a él y cómo debe protegerse.

### Comando o procedimiento
Se revisaron los principales campos de la tabla `clientes` y se asignaron finalidades, responsables, usuarios autorizados, medidas de protección y periodos de retención según la necesidad de cada dato.

### Resultado obtenido

| Dato | Finalidad | Responsable | Usuarios autorizados | Protección | Retención | Acción al finalizar |
|---|---|---|---|---|---|---|
| nombre | Identificar al cliente y atender sus solicitudes. | Atención al cliente | Atención al cliente y facturación cuando sea necesario. | Acceso restringido por roles y permisos. | Mientras sea necesario para el servicio y las obligaciones aplicables. | Eliminar o anonimizar cuando ya no sea necesario y sea procedente. |
| correo | Contactar al cliente y enviar información relacionada con el servicio. | Atención al cliente | Atención al cliente. | Limitar el acceso y proteger la información almacenada. | Mientras sea necesario para mantener la comunicación. | Eliminar o actualizar cuando corresponda. |
| telefono | Contactar al cliente cuando sea necesario. | Atención al cliente | Atención al cliente. | Acceso restringido al personal autorizado. | Mientras sea necesario para la atención. | Eliminar cuando deje de ser necesario y sea procedente. |
| rfc | Realizar procesos de facturación. | Facturación | Personal de facturación autorizado y DBA para tareas justificadas. | Permisos restringidos y protección de la información. | Durante el periodo requerido por las obligaciones aplicables. | Eliminar o bloquear su uso cuando termine el periodo correspondiente, según proceda. |
| edad | Realizar análisis generales de los clientes. | Analítica | Analítica, preferentemente mediante rangos de edad. | Utilizar datos agrupados cuando sea posible. | Mientras sea necesaria para el análisis. | Eliminar o conservar únicamente datos anonimizados cuando corresponda. |
| ciudad | Registrar la ubicación general y realizar estadísticas. | Atención al cliente y analítica | Atención al cliente y analítica. | Limitar el acceso según la función y utilizar datos agrupados para análisis. | Mientras sea necesaria para el servicio o el análisis. | Eliminar o anonimizar cuando ya no sea necesaria y sea procedente. |
| codigo_postal | Registrar la ubicación y realizar análisis geográficos cuando se requiera. | Atención al cliente | Personal autorizado que necesite ese dato. | Acceso restringido y uso de regiones agrupadas para análisis. | Mientras sea necesario para la finalidad establecida. | Eliminar o anonimizar cuando deje de ser necesario y sea procedente. |

### Análisis
La matriz permite identificar que no todos los usuarios necesitan acceder a todos los datos. Por ejemplo, facturación puede necesitar el RFC, mientras que analítica puede trabajar con rangos de edad y ciudades sin consultar información como el correo o el teléfono.

También se observa que cada dato debe tener una finalidad y un periodo de conservación definidos. Los accesos y las medidas de protección deben establecerse según las funciones de cada área.

### Conclusión
La matriz de gobierno de datos ayuda a organizar el uso y la protección de la información de los clientes. Definir responsables, permisos y periodos de retención permite reducir accesos innecesarios y administrar mejor los datos personales.
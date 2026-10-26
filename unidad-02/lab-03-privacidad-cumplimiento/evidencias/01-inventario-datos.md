# EVIDENCIAS
# Actividad 1 — Inventario y finalidad de los datos

## Objetivo

Identificar los datos que almacena la empresa, para qué se utilizan y quién debería tener acceso a ellos.

## Comando o procedimiento

Se revisaron los campos de la tabla `clientes` para identificar su finalidad, necesidad, nivel de acceso y tiempo de conservación.

## Resultado obtenido

| Campo | ¿Es dato personal? | Finalidad | ¿Es necesario? | Nivel de acceso | Retención |
|---|---|---|---|---|---|
| id | Sí, porque está relacionado con el registro de un cliente. | Identificar cada registro. | Sí, para distinguir a cada cliente. | Atención al cliente, facturación y DBA. | Mientras el registro sea necesario. |
| nombre | Sí, porque identifica a una persona. | Identificar al cliente y atender sus solicitudes. | Sí, para la atención y facturación. | Atención al cliente y facturación. | Mientras sea necesario para la relación con el cliente. |
| correo | Sí, porque permite contactar o identificar al cliente. | Enviar información relacionada con el servicio y atender consultas. | Sí, cuando se necesita contactar al cliente. | Atención al cliente. | Mientras sea necesario para la comunicación. |
| telefono | Sí, porque permite contactar directamente al cliente. | Comunicarse con el cliente cuando sea necesario. | Sí, si se requiere contacto telefónico. | Atención al cliente. | Mientras sea necesario para la atención. |
| rfc | Sí, porque se relaciona con una persona identificable. | Realizar procesos de facturación. | Sí, cuando se necesita para cumplir con las obligaciones fiscales. | Personal autorizado de facturación y DBA para tareas justificadas. | Durante el periodo requerido por las obligaciones aplicables. |
| edad | Sí, cuando se relaciona con un cliente identificable. | Conocer características generales de los clientes y realizar análisis. | Depende de la finalidad. | Personal autorizado que la necesite. | Mientras sea necesaria para la finalidad establecida. |
| ciudad | Sí, cuando se relaciona con un cliente identificable. | Registrar la ubicación general y generar estadísticas. | Sí, si se necesita para el servicio o análisis. | Atención al cliente y analítica, preferentemente con datos agrupados. | Mientras sea necesaria para la finalidad establecida. |
| codigo_postal | Sí, cuando se relaciona con un cliente identificable. | Registrar la ubicación y realizar análisis geográficos. | Depende de si se necesita para el servicio. | Personal autorizado que lo necesite. | Mientras sea necesario para la finalidad establecida. |
| fecha_alta | Sí, porque se relaciona con el registro de un cliente. | Conocer cuándo se registró y revisar la antigüedad de la relación. | Sí, para administrar los registros. | Atención al cliente, facturación cuando corresponda y DBA para tareas justificadas. | Mientras sea necesaria para administrar la relación y cumplir con las obligaciones aplicables. |

## Análisis

Al revisar los campos, encontramos que todos pueden relacionarse con una persona identificable, incluso los que no contienen directamente su nombre. Por eso, es importante considerar cómo se utilizan y con qué otros datos se relacionan.

También observamos que no todos los usuarios necesitan consultar toda la información. Por ejemplo, atención al cliente no necesita acceder al RFC si no lo requiere para realizar sus funciones, y el área de analítica puede trabajar con información agrupada sin identificar a cada cliente.

Los tiempos de conservación deben definirse según la finalidad de cada dato y las obligaciones aplicables. No sería adecuado conservar toda la información indefinidamente si ya no es necesaria.

## Conclusión

El inventario permite conocer qué datos almacena la empresa, para qué los necesita y quién debería consultarlos. Esto ayuda a evitar la recopilación innecesaria de información y a establecer controles de acceso y periodos de conservación adecuados.

Actividad 2 — Principio de minimización
Objetivo
Analizar qué datos necesita el área de atención al cliente y reducir la información que puede consultar para cumplir con su finalidad.
Análisis de la solicitud
1. ¿Todos los campos son necesarios para atención al cliente?

No. Para atender consultas, normalmente basta con el identificador del cliente, su nombre, correo y teléfono. Los demás datos deben incluirse solamente si existe una necesidad justificada.

2. ¿Por qué soporte necesitaría conocer el RFC?

En general, no lo necesita para atender consultas comunes. El RFC sería necesario únicamente si una solicitud específica requiere información fiscal.

3. ¿Necesita conocer la edad?

No necesariamente, porque la edad no suele ser indispensable para brindar atención al cliente.

4. ¿Necesita conocer el código postal?

No siempre. Solo sería necesario si algún proceso de atención requiere conocer la ubicación del cliente.

5. ¿Qué principio de privacidad está relacionado con esta decisión?

El principio de minimización de datos, que consiste en recopilar y utilizar únicamente los datos necesarios para cumplir una finalidad específica.

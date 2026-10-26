# EVIDENCIAS

## Actividad 6 — Derechos ARCO y la base de datos

### Objetivo
Identificar cómo localizar los datos personales de un cliente cuando solicita conocer la información que tiene registrada la organización.

### Comando o procedimiento
Se planteó una consulta para buscar al cliente mediante su correo electrónico y obtener los datos personales registrados en la tabla `clientes`.

### Resultado obtenido
La consulta permite localizar el registro del cliente y consultar su información personal, incluyendo nombre, correo, teléfono, RFC, edad, ciudad, código postal y fecha de alta.

### Análisis

**¿Qué información adicional debería proporcionar la organización además del resultado de esta consulta?**

Además de los datos encontrados, debería explicar de forma clara cómo se utiliza la información, para qué finalidad se conserva y qué área de la organización es responsable de ella.

### Conclusión
La consulta permite localizar la información registrada de un cliente. Esto facilita la atención de una solicitud de acceso a sus datos personales.

---

## Actividad 7 — Derecho de rectificación

### Objetivo
Actualizar un dato personal incorrecto sin modificar el resto de la información del cliente.

### Comando o procedimiento
Se planteó una actualización del correo electrónico del cliente con identificador `1`. Después, se realizó una consulta para verificar el correo registrado.

### Resultado obtenido
La actualización está diseñada para cambiar únicamente el correo electrónico del cliente cuyo identificador es `1`. La consulta posterior permite comprobar el correo registrado y revisar que corresponda al nuevo valor.

### Análisis

**1. ¿Cómo podría comprobarse que el cambio fue autorizado?**

Se podría comprobar mediante una solicitud del cliente o un procedimiento de validación establecido por la organización.

**2. ¿Debería registrarse quién realizó el cambio?**

Sí, porque permite identificar a la persona responsable de la modificación.

**3. ¿Por qué la trazabilidad será importante?**

Porque permite revisar qué cambios se hicieron, quién los realizó y cuándo ocurrieron. Esto ayuda a detectar errores y revisar posibles modificaciones no autorizadas.

### Conclusión
Actualizar únicamente el dato incorrecto ayuda a mantener la información del cliente al día. También es importante comprobar que el cambio esté autorizado y que quede registrado.

---

## Actividad 8 — Derecho de cancelación y ciclo de vida

### Objetivo
Identificar los lugares donde puede mantenerse la información de un cliente antes de realizar una cancelación.

### Comando o procedimiento
Se analizaron los posibles lugares donde pueden existir copias de los datos, como respaldos, réplicas, reportes, exportaciones y sistemas externos. Se elaboró un mapa para identificar dónde podría permanecer la información.

### Resultado obtenido
Se identificó que la información de un cliente puede encontrarse en diferentes lugares, además de la tabla principal `clientes`, como respaldos, reportes y archivos exportados.

### Análisis

**¿Por qué eliminar un registro de una tabla no necesariamente significa que toda la información relacionada con esa persona haya desaparecido de la organización?**

Porque pueden existir copias de los datos en otros lugares, como respaldos, réplicas, reportes y sistemas externos. Por eso, es necesario revisar dónde se encuentra la información antes de considerar completada la cancelación.

### Conclusión
Antes de cancelar los datos de un cliente, es importante revisar todo el ciclo de vida de la información y considerar las copias que puedan existir en otros sistemas.

---

## Actividad 9 — Derecho de oposición

### Objetivo
Analizar qué sucede cuando un cliente solicita que sus datos dejen de utilizarse para una finalidad secundaria.

### Comando o procedimiento
Se revisó el caso de un cliente que se opone al uso de sus datos para una finalidad específica. Se analizaron los datos que podrían necesitar conservarse, los usos que podrían detenerse y los mecanismos técnicos para separar las finalidades.

### Resultado obtenido
Se identificó que no siempre es necesario eliminar todos los datos del cliente. Algunos pueden necesitar conservarse para otras finalidades justificadas, mientras se limita su uso para la finalidad a la que se opuso.

### Análisis

**1. ¿Qué información podría necesitar mantenerse?**

La información necesaria para prestar el servicio al cliente o cumplir con obligaciones aplicables, cuando exista una razón válida para conservarla.

**2. ¿Qué información podría dejar de utilizarse para determinada finalidad?**

Los datos que se utilizan para la finalidad a la que el cliente se opuso, por ejemplo, el uso de su información para enviar promociones personalizadas.

**3. ¿Qué mecanismos técnicos podrían separar finalidades?**

Se pueden utilizar roles, permisos y vistas para limitar el acceso a los datos y evitar que se utilicen para fines distintos de los autorizados.

**4. ¿Por qué la decisión final no debe ser tomada únicamente por el DBA?**

Porque el DBA se encarga de la parte técnica de la base de datos, pero la decisión también depende de las áreas responsables de privacidad y cumplimiento.

### Conclusión
El derecho de oposición no significa necesariamente que deban eliminarse todos los datos del cliente. Es importante limitar su uso según la finalidad correspondiente y seguir las indicaciones de las áreas responsables.
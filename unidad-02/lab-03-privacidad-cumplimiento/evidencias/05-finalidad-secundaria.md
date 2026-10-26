# EVIDENCIAS

## Actividad 3 — Separación por finalidad

### Objetivo
Identificar qué información necesita el área de analítica para hacer sus consultas sin tener acceso a todos los datos personales de los clientes.

### Comando o procedimiento
Se revisaron las consultas para obtener la cantidad de clientes por ciudad y agruparlos por rangos de edad. La idea es utilizar datos generales para analizar la información sin mostrar datos que permitan identificar directamente a cada cliente.

### Resultado obtenido
Se plantearon consultas que permiten contar los clientes por ciudad y por rango de edad, sin incluir nombres, correos, teléfonos ni RFC.

### Análisis
**¿Por qué es más apropiado para analítica que entregar la tabla `clientes` completa?**

Porque el área de analítica puede obtener la información que necesita sin tener acceso a todos los datos personales. Así se evita compartir información que no es necesaria para hacer los análisis.

### Conclusión
Separar la información según su finalidad ayuda a que cada área trabaje únicamente con los datos que necesita y reduce la exposición de información personal.

---

## Actividad 4 — Control de acceso según la finalidad

### Objetivo
Limitar el acceso del área de analítica a la información que necesita para realizar sus consultas.

### Comando o procedimiento
Se propuso crear el rol `analista` y una vista llamada `v_analitica_clientes`, que muestra la ciudad y el rango de edad de los clientes. Después, se le asignó permiso al rol para consultar esa vista, sin darle acceso directo a la tabla original `clientes`.

También se incluyó una consulta para revisar los permisos asignados al rol.

### Resultado obtenido
La configuración está diseñada para que el rol `analista` pueda consultar la vista autorizada, sin recibir permisos directos sobre la tabla `clientes`. El resultado debe comprobarse al ejecutar el código y revisar los permisos.

### Análisis

**1. ¿Qué información puede consultar el rol `analista`?**

Puede consultar la ciudad y el rango de edad que aparecen en la vista `v_analitica_clientes`.

**2. ¿Puede consultar directamente la tabla `clientes`?**

No, porque no se le asignó permiso directo sobre esa tabla.

**3. ¿Puede obtener el nombre, correo o RFC de los clientes?**

No mediante la vista creada, ya que esos campos no están incluidos.

**4. ¿Qué principio de privacidad se aplica?**

El principio de minimización de datos, porque solo se comparte la información necesaria para la finalidad del análisis.

**5. ¿Qué principio de seguridad se aplica?**

El principio de mínimo privilegio, porque el rol solo recibe los permisos que necesita para realizar su trabajo.

### Conclusión
Crear roles y vistas permite controlar mejor quién puede consultar la información. De esta manera, el área de analítica puede trabajar sin tener acceso a todos los datos de los clientes.

---

## Actividad 5 — Uso de datos para una finalidad secundaria

### Objetivo
Analizar si la empresa puede utilizar los datos de sus clientes para enviar promociones personalizadas y qué debe tomar en cuenta antes de hacerlo.

### Comando o procedimiento
Se revisó el caso en el que la empresa quiere utilizar la edad, la ciudad y el comportamiento de compra de los clientes para ofrecer promociones. A partir de esta situación, se respondieron las preguntas sobre el uso de los datos, la información necesaria y los controles que podrían aplicarse.

### Resultado obtenido
Se identificó que, antes de utilizar los datos para promociones, la empresa debe revisar si esa finalidad es compatible con la razón por la que recopiló la información y qué datos necesita realmente.

### Análisis

**1. ¿Tener los datos significa que la empresa puede utilizarlos para cualquier finalidad?**

No. Que la empresa tenga los datos no significa que pueda utilizarlos para cualquier cosa. Primero debe revisar la finalidad para la que fueron recopilados y las condiciones aplicables a su uso.

**2. ¿Qué preguntas debería hacerse la organización antes de implementar las promociones?**

Debería revisar si el uso de los datos es compatible con la finalidad original, si informó a los clientes sobre ese uso, si necesita algún consentimiento y qué reglas de privacidad debe cumplir.

**3. ¿Qué datos son realmente necesarios?**

Podría necesitar la ciudad, un rango de edad y cierta información sobre las compras. No necesariamente necesita nombres, correos, teléfonos o RFC para analizar qué promociones podrían interesar a cada grupo.

**4. ¿El área de marketing necesita acceso directo a la tabla `clientes`?**

No necesariamente. Puede trabajar con una vista que contenga solo los datos necesarios para las promociones, sin tener acceso a toda la información personal.

**5. ¿Qué controles técnicos pueden limitar la información?**

Se pueden utilizar vistas, roles y permisos para limitar las consultas. También se pueden agrupar los datos por ciudad o rango de edad y evitar mostrar información personal cuando no sea necesaria.

### Conclusión
Antes de utilizar los datos para una nueva finalidad, la empresa debe revisar si ese uso es adecuado y qué información necesita. Aplicar permisos y limitar los datos disponibles ayuda a proteger la privacidad de los clientes.
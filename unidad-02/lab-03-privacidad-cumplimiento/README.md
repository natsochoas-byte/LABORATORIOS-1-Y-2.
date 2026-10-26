# Natalia Ochoa León 4-1
# Alexis Moises Montaño Araujo
# LAB_03
# INFORME FINAL:Privacidad, cumplimiento y gobierno de los datos

## 1. Introducción

En este laboratorio se trabajó con la privacidad y el manejo adecuado de los datos personales dentro de una base de datos. Se identificó que no basta con proteger la información mediante permisos y controles de seguridad, sino que también es necesario definir para qué se utiliza, quién puede acceder a ella y durante cuánto tiempo debe conservarse.

## 2. Inventario de datos

Se identificaron los siguientes datos en la tabla `clientes`:

| Dato | Clasificación | Finalidad |
|---|---|---|
| ID | Identificador | Distinguir cada registro |
| Nombre | Dato personal | Identificar al cliente |
| Correo electrónico | Dato personal | Comunicación con el cliente |
| Teléfono | Dato personal | Contacto con el cliente |
| RFC | Dato personal identificativo | Identificación fiscal cuando sea necesario |
| Edad | Dato personal | Análisis por grupos de edad cuando esté justificado |
| Ciudad | Dato de ubicación | Organización y análisis por ubicación |
| Código postal | Dato de ubicación | Ubicación general cuando sea necesario |
| Fecha de alta | Dato relacionado con el registro | Control del tiempo de permanencia del cliente |

La clasificación y el uso de cada dato deben revisarse de acuerdo con las necesidades de la organización.

## 3. Finalidades

Los datos deben utilizarse para propósitos específicos y justificados. Por ejemplo, el nombre, correo y teléfono pueden utilizarse para la atención y comunicación con los clientes. La ciudad y la edad pueden utilizarse para generar estadísticas, preferentemente mediante agrupaciones que no expongan información individual.

Los datos no deben utilizarse automáticamente para cualquier propósito nuevo. Antes de hacerlo, se debe revisar si ese uso está justificado y autorizado.

## 4. Minimización

El principio de minimización consiste en recopilar y conservar únicamente los datos necesarios para cumplir con una finalidad.

En el laboratorio se propuso una tabla de soporte con los campos `id`, `nombre`, `correo` y `telefono`, evitando copiar información como el RFC, la edad, la ciudad y el código postal cuando no sea necesaria para esa función.

También se identificó que otros datos, como la ocupación, el salario o el estado civil, no deberían recopilarse si no existe una razón que lo justifique. Limitar la información reduce la exposición y facilita su protección.

## 5. Control de acceso

Los permisos deben relacionarse con las funciones de cada usuario. Para ello, se propuso crear un rol de analista con acceso a una vista que contiene únicamente la ciudad y el rango de edad de los clientes.

De esta manera, el analista puede consultar información para generar estadísticas sin tener acceso directo a todos los datos personales de la tabla original. Este control aplica el principio de mínimo privilegio, ya que cada usuario recibe únicamente los permisos necesarios para realizar su trabajo.

## 6. Derechos ARCO

Los derechos de acceso, rectificación, cancelación y oposición tienen implicaciones técnicas para la administración de las bases de datos.

- **Acceso:** se necesita localizar y consultar los datos de una persona.
- **Rectificación:** se debe modificar la información incorrecta y verificar el cambio.
- **Cancelación:** se debe evaluar la eliminación o el bloqueo de los datos, considerando las obligaciones aplicables y las copias relacionadas.
- **Oposición:** se debe poder limitar o detener el uso de los datos para determinadas finalidades cuando corresponda.

Para atender estas solicitudes es importante identificar dónde se encuentran los datos, controlar quién realiza los cambios y mantener registros de las operaciones. También deben considerarse respaldos, réplicas y otras copias de la información.

## 7. Retención

El periodo de conservación debe determinarse considerando la finalidad del tratamiento, las necesidades de la organización y las obligaciones aplicables. No todos los datos tienen que conservarse durante el mismo tiempo.

La organización debe documentar los periodos establecidos y definir qué sucede cuando se cumplen. Según corresponda, los datos pueden eliminarse, bloquearse o conservarse cuando exista una obligación que lo justifique. Mantener información indefinidamente aumenta los riesgos de exposición y uso indebido.

## 8. Gobierno de datos

El gobierno de datos requiere distribuir las responsabilidades entre las personas y áreas que participan en el manejo de la información.

| Área o responsable | Responsabilidad |
|---|---|
| DBA | Implementar permisos, roles, respaldos, controles técnicos y mecanismos de auditoría. |
| Responsable de privacidad | Revisar el uso de datos personales y coordinar los criterios de privacidad. |
| Área jurídica | Orientar sobre las obligaciones legales y los requisitos aplicables. |
| Propietario de los datos | Definir las necesidades del área, justificar las finalidades y validar los accesos requeridos. |
| Desarrollo | Utilizar los datos necesarios para desarrollar y probar sistemas, aplicando medidas para evitar la exposición de información real. |

Las decisiones deben coordinarse entre las áreas involucradas y no depender únicamente del administrador de la base de datos.

## 9. Evaluación integral

Durante la evaluación se identificaron riesgos relacionados con el acceso excesivo a los datos, la exposición de información identificativa, la conservación durante periodos prolongados y la falta de políticas claras.

También se consideraron los riesgos de copiar bases de datos productivas completas a ambientes de desarrollo, utilizar información personal para finalidades secundarias sin una justificación clara y no contar con procedimientos definidos para eliminar los datos cuando corresponda.

Para reducir estos riesgos se propusieron controles como limitar los permisos, utilizar vistas con información restringida, minimizar los datos recopilados, establecer periodos de retención, registrar las operaciones y definir responsabilidades.

## 10. Conclusiones

Con este laboratorio aprendí que la privacidad, la seguridad y la administración de bases de datos están relacionadas, pero no son lo mismo. Una base de datos puede tener controles de seguridad y aun así utilizar información personal para finalidades que no estén justificadas.

Por eso es importante limitar los datos que se recopilan, asignar permisos de acuerdo con las funciones de cada usuario y establecer periodos de conservación. También comprendí que el DBA implementa los controles técnicos, pero las decisiones sobre las finalidades y el uso de la información deben involucrar a otras áreas responsables.

## 11. Preguntas de reflexión

### 1. ¿Una base de datos técnicamente segura necesariamente cumple con todos los requisitos de privacidad?

No. La seguridad protege la información contra accesos no autorizados y otros riesgos, pero la privacidad también requiere justificar las finalidades, limitar los datos y establecer cuánto tiempo se conservarán.

### 2. ¿Por qué el principio de mínimo privilegio también contribuye a la privacidad?

Porque limita el acceso a los datos personales únicamente a quienes los necesitan para realizar sus funciones, reduciendo la posibilidad de exposición o uso indebido.

### 3. ¿Por qué el DBA no debería decidir por sí solo la finalidad del tratamiento de los datos?

Porque la finalidad debe justificarse según las necesidades de la organización y las obligaciones aplicables. El DBA se encarga principalmente de implementar los controles técnicos, por lo que debe coordinarse con las áreas responsables.

### 4. ¿Por qué los desarrolladores no deberían recibir automáticamente copias completas de bases de datos productivas?

Porque podrían recibir datos personales que no necesitan para desarrollar o probar sistemas. Esto aumenta la cantidad de personas y entornos que pueden acceder a la información.

### 5. ¿Por qué una copia utilizada para desarrollo también puede representar un riesgo de privacidad?

Porque puede contener información personal real y quedar expuesta a personas que no deberían acceder a ella. Por eso deben limitarse los datos utilizados y aplicarse controles de acceso y protección.

### 6. ¿Por qué la retención debe formar parte del ciclo de vida de los datos?

Porque desde que se recopilan los datos debe definirse cuánto tiempo son necesarios y qué se hará con ellos al terminar ese periodo. Esto evita conservar información sin una finalidad justificada.

### 7. ¿Qué relación existe entre privacidad por diseño y diseño de bases de datos?

La privacidad por diseño implica considerar la protección de los datos desde la estructura de la base de datos. Esto incluye recopilar solo lo necesario, separar funciones, limitar accesos y definir mecanismos de conservación y eliminación.

### 8. ¿Qué controles técnicos implementarías para reducir el riesgo de exposición de datos personales?

Implementaría roles y permisos limitados, vistas con información restringida, cifrado cuando corresponda, registros de auditoría, copias de respaldo protegidas y procedimientos para eliminar o limitar el acceso a los datos cuando sea necesario.

### 9. ¿Qué información debería conocer un DBA para responder técnicamente a una solicitud ARCO?

Necesita conocer dónde están almacenados los datos de la persona, qué tablas y sistemas los contienen, quién tiene acceso, qué respaldos o réplicas existen y qué procedimientos permiten consultar, modificar, bloquear o eliminar la información según corresponda.

### 10. ¿Qué responsabilidades deberían corresponder al DBA, al responsable de privacidad, al área jurídica y al propietario de los datos?

El DBA debe implementar y mantener los controles técnicos. El responsable de privacidad debe coordinar los criterios de protección de datos. El área jurídica debe orientar sobre las obligaciones aplicables y el propietario de los datos debe justificar las finalidades y necesidades de acceso de su área. Estas responsabilidades deben coordinarse para asegurar un manejo adecuado de la información.
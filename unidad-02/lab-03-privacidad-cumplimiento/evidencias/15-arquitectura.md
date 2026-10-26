# EVIDENCIAS

## Actividad 15 — Propuesta de arquitectura de datos protegidos

### Objetivo
Proponer una forma de organizar la información de los clientes según su finalidad, aplicando controles para proteger los datos personales.

### Comando o procedimiento
Se diseñó una propuesta conceptual que separa los datos utilizados para la operación, los análisis y la auditoría. Para cada área se consideraron los accesos necesarios y las medidas para proteger la información durante su uso y conservación.

### Resultado obtenido

La propuesta de arquitectura es la siguiente:

```text
                         BASE DE DATOS
                               |
              ┌────────────────┼────────────────┐
              |                |                |
              ▼                ▼                ▼
          OPERACIÓN         ANALÍTICA        AUDITORÍA
              |                |                |
              ▼                ▼                ▼
       Datos necesarios    Datos agrupados   Registros de
       para el servicio    y estadísticas    actividades
              |                |                |
              ▼                ▼                ▼
       Acceso limitado    Sin datos que     Acceso limitado
       por roles          no se necesitan   a personal autorizado
```

Los controles propuestos son:

| Control | Aplicación |
|---|---|
| Acceso | Asignar roles y permisos según las funciones de cada área. |
| Minimización | Utilizar únicamente los datos necesarios para cada finalidad. |
| Protección de información sensible | Restringir el acceso a datos como el RFC y protegerlos adecuadamente. |
| Retención | Establecer periodos de conservación según la finalidad y las obligaciones aplicables. |
| Trazabilidad | Registrar quién consulta o modifica información cuando corresponda. |
| Eliminación | Definir procedimientos para eliminar o anonimizar datos cuando ya no sean necesarios y proceda hacerlo. |
| Atención de solicitudes | Establecer procedimientos para localizar, actualizar o cancelar datos cuando corresponda. |

### Análisis
Separar la información por finalidad permite que cada área tenga acceso únicamente a los datos que necesita. Por ejemplo, analítica puede utilizar datos agrupados para generar estadísticas, mientras que operación consulta la información necesaria para atender a los clientes.

También es importante controlar los accesos, registrar las actividades relevantes y definir cuánto tiempo se conservará la información. De esta manera, la protección de los datos se considera desde el diseño de la arquitectura.

### Conclusión
Esta propuesta permite organizar los datos de acuerdo con su finalidad y aplicar controles para reducir el acceso innecesario a información personal. No es necesario implementar toda la arquitectura físicamente para identificar cómo podrían aplicarse los principios de privacidad mediante decisiones técnicas.

## Actividad 22 — Verificación final

### Privacidad
La seguridad de la información busca proteger los datos contra accesos no autorizados, pérdidas o modificaciones. La privacidad se enfoca en que los datos personales se utilicen de forma adecuada y para finalidades justificadas.

### Finalidad
Una organización no debería utilizar automáticamente todos los datos para cualquier propósito porque la información debe usarse únicamente para fines justificados y autorizados. Utilizarla para otros propósitos puede afectar la privacidad de las personas.

### Minimización
Almacenar más información no necesariamente es mejor porque los datos que no son necesarios aumentan los riesgos de exposición y dificultan su protección y administración.

### ARCO
Los derechos ARCO implican que la organización debe contar con mecanismos para consultar los datos personales, corregirlos, eliminarlos cuando corresponda y detener ciertos usos cuando la persona se oponga. Esto requiere procedimientos y controles técnicos para localizar, modificar o eliminar información y limitar su uso.

### Retención
La conservación indefinida puede representar un riesgo porque mantiene información personal durante más tiempo del necesario, aumentando la posibilidad de exposición, acceso no autorizado o uso indebido.

### Gobierno
Las decisiones sobre qué datos pueden utilizarse y para qué finalidad deben involucrar a las áreas responsables de la información, privacidad, cumplimiento y negocio, según corresponda.

### DBA
El DBA es responsable de implementar y mantener los controles técnicos de la base de datos, como permisos, roles, respaldos y mecanismos de protección. Sin embargo, las decisiones sobre finalidades, plazos de conservación y cumplimiento deben involucrar a las áreas responsables, no depender únicamente del DBA.
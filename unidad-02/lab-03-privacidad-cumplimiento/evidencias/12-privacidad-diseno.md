# EVIDENCIAS

## Actividad 12 — Privacidad por diseño

### Objetivo
Analizar la estructura propuesta para registrar clientes e identificar qué datos son necesarios y cómo proteger su privacidad desde el diseño de la aplicación.

### Comando o procedimiento
Se revisaron los campos propuestos para la tabla `clientes` y se analizaron las preguntas sobre la necesidad de cada dato, los principios de privacidad y las medidas que podrían aplicarse desde el inicio.

### Resultado obtenido
Se identificó que la propuesta incluye varios datos personales que podrían no ser necesarios para el funcionamiento de la aplicación. Antes de agregarlos, se debe definir para qué se utilizará cada uno.

### Análisis

**1. ¿Qué problemas identificas?**

Se propone guardar demasiada información sin explicar para qué se necesita cada dato. Esto puede aumentar los riesgos de exposición y el acceso innecesario a información personal.

**2. ¿Qué principio de privacidad se está ignorando?**

El principio de minimización de datos, porque se pretende recopilar información sin comprobar si es necesaria.

**3. ¿Qué preguntas realizarías antes de aprobar el diseño?**

- ¿Para qué se necesita cada dato?
- ¿Es indispensable para el funcionamiento de la aplicación?
- ¿Quién tendrá acceso a esa información?
- ¿Cuánto tiempo se conservará?
- ¿Cómo se protegerán los datos?

**4. ¿Qué datos eliminarías?**

Eliminaría inicialmente los campos `ocupacion`, `salario` y `estado_civil`, además de `fecha_nacimiento` y `direccion` si no son necesarios para el servicio. Solo los incluiría si existe una finalidad que justifique su recopilación.

**5. ¿Qué datos requerirían una justificación adicional?**

El RFC, la edad, la dirección, la fecha de nacimiento, la ocupación, el salario y el estado civil, porque se debe explicar para qué se necesita cada uno antes de recopilarlo.

**6. ¿Cómo aplicarías privacidad por defecto?**

Solicitaría únicamente los datos necesarios, limitaría los permisos según las funciones de cada usuario y establecería medidas de protección y periodos de conservación desde el inicio.

### Conclusión
La privacidad por diseño consiste en considerar la protección de los datos desde que se desarrolla una aplicación. En lugar de guardar toda la información por si acaso, se deben incluir únicamente los datos necesarios para una finalidad definida.

---

## Actividad 13 — Diferenciar controles técnicos y administrativos

### Objetivo
Distinguir entre las medidas técnicas y administrativas que ayudan a proteger los datos personales.

### Comando o procedimiento
Se revisaron las medidas propuestas y se clasificaron según su función. Las medidas técnicas se aplican mediante herramientas o configuraciones, mientras que las administrativas establecen reglas y procedimientos para el manejo de la información.

### Resultado obtenido

| Medida | Técnico | Administrativo |
|---|:---:|:---:|
| Crear roles de PostgreSQL | X | |
| Política de retención | | X |
| Cifrado de datos | X | |
| Procedimiento para solicitudes ARCO | | X |
| Vista con información limitada | X | |
| Clasificación de información | | X |
| Registro de auditoría | X | |
| Política de control de acceso | | X |

### Análisis
La mayoría de las medidas se pueden clasificar según su función principal. Por ejemplo, crear roles y vistas en PostgreSQL permite limitar técnicamente el acceso a los datos, mientras que una política de retención establece las reglas sobre cuánto tiempo debe conservarse la información.

Algunas medidas pueden involucrar ambos tipos de control. Por ejemplo, el registro de auditoría requiere herramientas técnicas para guardar los eventos, pero también reglas administrativas para definir qué se registra, quién lo revisa y cómo se utiliza.

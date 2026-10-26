# EVIDENCIAS

## Actividad 14 — Escenario integral

### Objetivo
Identificar los problemas de privacidad y seguridad en el manejo de los datos de los clientes y proponer controles para reducir los riesgos.

### Comando o procedimiento
Se analizó la situación de la empresa y se identificaron los riesgos relacionados con el acceso a los datos, su conservación, el uso para otras finalidades y las copias utilizadas durante el desarrollo.

### Resultado obtenido

| Problema | Principio afectado | Riesgo | Control propuesto |
|---|---|---|---|
| 1. Todos los empleados de analítica pueden consultar la tabla `clientes` completa. | Mínimo privilegio y minimización de datos. | Acceso a información personal que no necesitan. | Crear una vista con los datos necesarios para generar estadísticas. |
| 2. Analítica puede consultar nombres y correos. | Minimización de datos. | Exposición innecesaria de información que identifica a los clientes. | Excluir los campos que no se necesitan para los análisis. |
| 3. Analítica tiene acceso a los teléfonos y RFC. | Mínimo privilegio. | Uso o divulgación no autorizada de datos personales. | Restringir esos campos a las áreas que realmente los necesiten. |
| 4. Los datos se conservan desde hace 12 años. | Limitación de la conservación. | Mantener información que podría haber dejado de ser necesaria. | Revisar qué datos deben conservarse y durante cuánto tiempo. |
| 5. No existe una política documentada de retención. | Responsabilidad y gobierno de datos. | No tener criterios claros para eliminar o conservar información. | Crear y documentar una política de retención. |
| 6. Los desarrolladores reciben copias completas de la base de datos. | Minimización y mínimo privilegio. | Que más personas tengan acceso a información personal de la necesaria. | Entregar copias limitadas a los datos requeridos para las pruebas. |
| 7. Las copias de desarrollo contienen información real. | Confidencialidad y privacidad por diseño. | Exposición de datos personales fuera del entorno de producción. | Utilizar datos ficticios o anonimizados para las pruebas. |
| 8. Marketing utiliza los correos para campañas promocionales sin una finalidad claramente documentada. | Limitación de la finalidad. | Utilizar datos para un propósito que no ha sido evaluado adecuadamente. | Revisar y documentar la finalidad y las condiciones aplicables antes de usar los correos. |
| 9. No existe documentación clara sobre la finalidad de cada dato. | Limitación de la finalidad y responsabilidad. | Utilizar información sin criterios claros sobre su propósito. | Crear un inventario que indique la finalidad de cada campo. |
| 10. No se menciona una revisión de los permisos de los empleados. | Mínimo privilegio. | Que personas que ya no necesitan los datos mantengan acceso. | Revisar periódicamente los roles y permisos. |
| 11. No se especifica qué protección tienen los datos personales. | Confidencialidad y seguridad. | Que la información quede expuesta ante accesos no autorizados. | Aplicar permisos adecuados y proteger los datos almacenados. |
| 12. No se indica cómo se eliminan los datos cuando dejan de ser necesarios. | Limitación de la conservación. | Que la información permanezca almacenada sin una razón válida. | Definir procedimientos para eliminar o anonimizar los datos cuando corresponda. |

### Análisis
Los principales problemas son el acceso demasiado amplio a los datos, la falta de una política de retención y el uso de información real en las copias de desarrollo. También falta claridad sobre la finalidad de cada dato y sobre el uso de los correos para campañas promocionales.

La empresa podría reducir estos riesgos limitando los permisos, utilizando vistas para las estadísticas, trabajando con datos ficticios en desarrollo y estableciendo reglas claras sobre la conservación y el uso de la información.

### Conclusión
La empresa necesita mejorar la forma en que administra y protege los datos de sus clientes. Definir finalidades, limitar los accesos y establecer políticas de retención ayudaría a reducir riesgos y evitar el uso innecesario de información personal.
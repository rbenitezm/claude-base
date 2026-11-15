# Conocimiento del proyecto

Lo aprendido trabajando en el proyecto que no se deduce del código: reglas, trampas verificadas y lecciones. Vive aquí, en el repo, para que lo lea cualquier sesión, también los agentes en la nube.

**Cómo se mantiene:**
- **Aquí van reglas, trampas y lecciones, NO estado ni listas de pendientes.** Lo pendiente vive solo en [pendientes](../pendientes.md); las decisiones y dudas, en [decisiones](../decisiones.md).
- Una nota por tema. Si algo cambia, se edita la nota (con fecha), no se añade otra. La línea «>» de cada nota es su descripción y es la misma que la de este índice.
- Formato de una nota: título, línea «>», qué pasó (con fecha), **Why:** y **How to apply:**.
- Si una nota resulta falsa, se corrige. Si queda superada, se marca «Histórico (fecha): superado por X» al principio.
- Fechas absolutas («5-oct-2026», nunca «ayer»).
- La memoria local de Claude solo guarda punteros a estas notas.
- Las notas marcadas «(de claude-base)» vienen de la plantilla común; si una lección nueva vale para todos los proyectos, se propone subirla a `claude-base`.

## Notas

- [Bug classes checklist](bug-classes-checklist.md) — familias de bugs que vuelven una y otra vez (silencios, límites por defecto, carreras, orden, estado desde props, ficheros, despacho por tipo, prompts de imagen): revisar el código nuevo contra ellas
- [La base de datos no se borra sin preguntar](bd-no-se-borra.md) — borrar, restaurar o pisar datos existentes se pregunta antes y se espera la respuesta; copias que se verifican, no que se suponen
- [JSON compartido: fusionar, nunca reconstruir](json-compartido-fusionar.md) — toda columna o fichero JSON que escriben varias partes se actualiza con `{ ...previo, … }` leído justo antes
- [E2E solo con desechables](e2e-solo-desechables.md) — si las pruebas tocan datos reales: usuarios de un dominio de prueba, limpieza solo de lo que poseen, nunca de lo compartido
- [Funciona en local, falla en producción](local-no-es-produccion.md) — binarios y librerías nativas cambian de un entorno a otro y fallan en silencio; comprobar en el entorno real con una sonda
- [Pruebas que fallan primero](pruebas-que-fallan-primero.md) — el método de Raúl para auditorías y arreglos: analizar, planificar, prueba que falla, arreglo, la prueba pasa a la suite normal; la migración antes que el código
- [No esperar despliegues](no-esperar-despliegues.md) — tras el push, avisar y parar; nada de sondear el despliegue ni mirar la web al minuto
- [Imágenes de comprobación](imagenes-de-comprobacion.md) — una imagen de prueba enviada por chat parece un entregable: decir siempre «no es para subir» y mirar qué fichero hay de verdad antes de diagnosticar

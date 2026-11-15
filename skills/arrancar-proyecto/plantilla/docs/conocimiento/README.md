# Conocimiento del proyecto

Lo aprendido trabajando en el proyecto que no se deduce del código: reglas, trampas verificadas y lecciones. Vive aquí, en el repo, para que lo lea cualquier sesión, también los agentes en la nube.

**Cómo se mantiene:**
- **Aquí van reglas, trampas y lecciones, NO estado ni listas de pendientes.** Lo pendiente vive solo en [pendientes](../pendientes.md); las decisiones y dudas, en [decisiones](../decisiones.md).
- Una nota por tema. Si algo cambia, se edita la nota (con fecha), no se añade otra. La línea «>» de cada nota es su descripción y es la misma que la de este índice.
- Formato de una nota: título, línea «>», qué pasó (con fecha), **Why:** y **How to apply:**.
- Si una nota resulta falsa, se corrige. Si queda superada, se marca «Histórico (fecha): superado por X» al principio.
- Fechas absolutas («5-oct-2026», nunca «ayer»).
- La memoria local de Claude solo guarda punteros a estas notas.
- **Lo que vale fuera del proyecto sube a `claude-base`** (las reglas comunes de Raúl). Las marcas van **delante del enlace** en este índice, no en la línea «>»:
  - «(genérica)»: sirve en cualquier proyecto (o en cualquiera con el mismo stack) y aún no está en claude-base. La pone quien escribe o cambia la nota, también los agentes en la nube.
  - «(en claude-base)»: ya está allí (las que vinieron con la plantilla dicen «(de claude-base)» en su texto). Si la nota cambia de forma que importe fuera, se vuelve a marcar «(genérica)».
  - En el Mac de Raúl, una revisión mensual sube lo marcado, sin datos del proyecto (ver `REVISIONES.md` de claude-base).

## Notas

- (en claude-base) [Bug classes checklist](bug-classes-checklist.md) — familias de bugs que vuelven una y otra vez (silencios, límites por defecto, carreras, orden, estado desde props, ficheros, despacho por tipo, prompts de imagen): revisar el código nuevo contra ellas
- (en claude-base) [La base de datos no se borra sin preguntar](bd-no-se-borra.md) — borrar, restaurar o pisar datos existentes se pregunta antes y se espera la respuesta; copias que se verifican, no que se suponen
- (en claude-base) [JSON compartido: fusionar, nunca reconstruir](json-compartido-fusionar.md) — toda columna o fichero JSON que escriben varias partes se actualiza con `{ ...previo, … }` leído justo antes
- (en claude-base) [E2E solo con desechables](e2e-solo-desechables.md) — si las pruebas tocan datos reales: usuarios de un dominio de prueba, limpieza solo de lo que poseen, nunca de lo compartido
- (en claude-base) [Funciona en local, falla en producción](local-no-es-produccion.md) — binarios y librerías nativas cambian de un entorno a otro y fallan en silencio; comprobar en el entorno real con una sonda
- (en claude-base) [Pruebas que fallan primero](pruebas-que-fallan-primero.md) — el método de Raúl para auditorías y arreglos: analizar, planificar, prueba que falla, arreglo, la prueba pasa a la suite normal; la migración antes que el código
- (en claude-base) [No esperar despliegues](no-esperar-despliegues.md) — tras el push, avisar y parar; nada de sondear el despliegue ni mirar la web al minuto
- (en claude-base) [Imágenes de comprobación](imagenes-de-comprobacion.md) — una imagen de prueba enviada por chat parece un entregable: decir siempre «no es para subir» y mirar qué fichero hay de verdad antes de diagnosticar

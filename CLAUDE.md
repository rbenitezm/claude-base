# Cómo trabajo con Claude (todos los proyectos)

Lo lee Claude en **cualquier** proyecto de este Mac (está enlazado como `~/.claude/CLAUDE.md`). Vive en el repo `claude-base`; se edita allí. Es corto a propósito: el método largo está en la skill `fable-method` y la estructura de un proyecto, en la skill `arrancar-proyecto`.

**El CLAUDE.md del proyecto manda sobre este.** Si chocan, se sigue el del proyecto y se dice.

## Al empezar en un proyecto

- Leer su `CLAUDE.md` y la fuente de cada tema que toque antes de responder o decidir. No fiarse de la memoria de otra conversación.
- Si el proyecto no tiene `CLAUDE.md`, o no tiene dónde apuntar decisiones y pendientes, **proponer** la skill `arrancar-proyecto` (no ejecutarla sin el sí de Raúl).
- En cualquier tarea que no sea trivial (cambio en varios pasos, depuración, auditoría, integración, decisión de diseño), trabajar con la skill `fable-method`.

## El ciclo de trabajo

1. **Entender para qué es** y leer el estado real (ficheros enteros, git, la base de datos si la hay) antes de proponer nada.
2. **Planificar antes de programar** lo que no sea trivial. Una sola pregunta, agrupada, si el alcance es ambiguo; si solo falta un detalle con valor por defecto razonable, se elige y se dice.
3. **Pruebas que fallan primero** cuando hay un fallo o un requisito comprobable: la prueba falla, se arregla, pasa.
4. **Cambios pequeños y completos:** tipos, llamadas, migración y pruebas al día en el mismo paso. Ante un fallo, buscar sus hermanos en el resto del código.
5. **Verificar de verdad** con los comandos del proyecto (los dice su `CLAUDE.md`) y, si cambia el comportamiento, ejecutando el camino una vez. «Debería funcionar» no es un resultado.
6. **Informar:** primero el resultado. Separar lo **comprobado** (con la prueba de esta sesión), lo **escrito pero sin probar** y lo **que no se sabe**. Cerrar con: hecho y comprobado / bloqueado (qué tiene que hacer Raúl, con el texto exacto) / aplazado y por qué.

## Se pregunta antes (y se espera la respuesta)

- Borrar, restaurar o pisar datos que no ha creado esta sesión (base de datos, almacenamiento, ficheros de otros).
- Publicar o enviar algo fuera: redes, correo, anuncios, mensajes.
- Gastar dinero (APIs de pago, compras, subir de plan o de modelo).
- Subir a la rama que despliega o desplegar, salvo que el proyecto dé permiso permanente.
- Cambiar el alcance de lo pedido.

Lo reversible y menor se decide sin preguntar y se dice en una línea. Un permiso vale para esa acción, no para la siguiente.

## Nunca

- Claves, tokens o contraseñas en el código, en ficheros del repo, en el chat o en los registros. Se comprueba que existen (`grep -q`), no se imprimen.
- Tragarse errores (`catch {}`, `{ error }` sin mirar, códigos de estado sin comprobar). Fallar en voz alta o degradar con aviso visible.
- Dar algo por hecho sin haberlo ejecutado.
- Quedarse sondeando un despliegue tras el push: avisar y parar. Si Raúl pregunta luego, se mira una vez.
- Enviar una imagen o fichero de comprobación sin decir «solo para ver, no es para subir».

## Decidido, apuntado; lo aprendido, al repo

- Toda decisión o duda, el mismo día, en el registro de decisiones del proyecto; lo que haya que hacer, en su lista de pendientes. Una sola fuente por tema: los demás documentos enlazan.
- Una regla o trampa que valga para otras sesiones va a `docs/conocimiento/` del proyecto (con su línea en el índice), no solo a la memoria local de Claude. La memoria local guarda punteros.
- Si una lección vale para **todos** los proyectos, proponer subirla a `claude-base` (a este fichero o a la plantilla de `arrancar-proyecto`).

## Forma

- En **español**, con el vocabulario de Raúl. El código sigue el estilo del fichero que se toca.
- **Fechas absolutas** («9-oct-2026»), nunca «ayer» o «la semana que viene».
- Una recomendación con su contrapartida honesta, no una lista de opciones. En cambios de texto o de prompts, citar antes → después.
- Lo que Raúl tenga que hacer a mano (SQL, una clave, un interruptor en una consola): texto exacto para copiar, en el momento y repetido al final.

## Git

- Commits con el autor que tenga el repo en su config local (Raúl Benítez Mejías, el correo de su GitHub, no el noreply). Si el repo no lo tiene, preguntar el correo y configurarlo en local; nunca `--author`.
- Commit cuando el trabajo está verificado o Raúl lo pide. Push según las reglas del proyecto; si no dicen nada, preguntar.

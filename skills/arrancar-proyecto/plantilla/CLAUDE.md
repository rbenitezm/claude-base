# CLAUDE.md

Lo primero que lee cualquier sesión de Claude en este repositorio, en el Mac de Raúl o en la nube. Es corto a propósito: dice dónde está cada cosa y qué no se hace nunca. El detalle vive en los documentos enlazados. Las reglas generales de trabajo de Raúl están en su `~/.claude/CLAUDE.md` (las sesiones en la nube no lo ven: lo imprescindible está repetido aquí abajo).

## El proyecto

{{Qué es en una o dos frases y para quién.}} Lo lleva {{quién decide}}. Puesta en marcha: `README.md`.

Se trabaja en **{{español}}**: textos, documentos y mensajes. El código sigue el estilo del fichero que se toca.

## Una fuente por tema

Cada tema vive en **un solo sitio**. Antes de responder o de decidir sobre algo, se lee su fuente, no lo que diga otro documento o la memoria de otra conversación. Si otro documento contradice la fuente, se corrige el otro. Los demás documentos no repiten: enlazan.

| Tema | La fuente |
|---|---|
| **Decisiones tomadas y dudas abiertas** (con fecha) | `docs/decisiones.md` |
| **Lo que queda por hacer** | `docs/pendientes.md` |
| Reglas, trampas y lecciones (no estado ni pendientes) | `docs/conocimiento/` (empieza por su `README.md`) |
| {{tema}} | {{fichero}} |

Cuando aparezca un tema nuevo con vida propia (precios, legal, marketing, arquitectura…), se le da un fichero y una fila aquí.

## Reglas duras

1. **{{La base de datos de producción}} no se borra ni se restaura sin preguntar a {{Raúl}} y esperar su respuesta.** Leer es libre; escribir sobre lo existente, no. Ver `docs/conocimiento/bd-no-se-borra.md`.
2. **Publicar es humano.** Nada sale en {{redes, correo o anuncios}} sin el visto bueno de {{Raúl}} para ese envío concreto.
3. **Las claves nunca van en el código** ni en ficheros del repositorio. En la nube, como secretos del entorno.
4. **Subir a `{{main}}` despliega.** {{Hay permiso permanente para … / Se espera a que Raúl lo pida.}} Los agentes en la nube trabajan en ramas `claude/…` y abren un pull request. Su entorno de claude.ai/code lleva en el script de configuración el `nube/setup.sh` de claude-base.
5. **{{Las pruebas E2E van contra la base de datos real: solo usuarios desechables y se limpia solo lo creado.}}** Ver `docs/conocimiento/e2e-solo-desechables.md`.

## Cómo se trabaja

- **Decidido, apuntado:** toda decisión o duda se escribe el mismo día en `docs/decisiones.md`, y lo que haya que hacer, en `docs/pendientes.md`. El detalle, en el documento del tema, que enlaza a la decisión en vez de repetirla.
- **Lo aprendido, al repositorio:** una regla o una trampa que valga para otras sesiones se escribe en `docs/conocimiento/` (y se añade a su índice), no solo en la memoria local de Claude. Si la lección vale también fuera de este proyecto, se marca «(genérica)» en el índice para subirla a `claude-base`.
- **Antes de dar algo por hecho:** `{{pnpm typecheck}}`, `{{pnpm lint}}` y `{{pnpm test}}`. Código nuevo: repasar `docs/conocimiento/bug-classes-checklist.md`.
- **Fechas absolutas** («9-oct-2026»), nunca «ayer» o «la semana que viene».

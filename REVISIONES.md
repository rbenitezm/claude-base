# Revisiones: lo que sube de los proyectos a claude-base

Cómo llegan aquí las lecciones de cada proyecto, y hasta dónde se ha revisado cada uno. Lo lee la tarea programada «Revisión mensual de claude-base» (primer lunes de cada mes, en el Mac de Raúl) y cualquiera que haga la revisión a mano.

## Cómo se marca en un proyecto

En el índice `docs/conocimiento/README.md` de cada proyecto, delante del enlace de la nota:
- **«(genérica)»**: la lección vale fuera del proyecto y aún no está aquí.
- **«(en claude-base)»**: ya está aquí.

## Cómo se hace la revisión

Por cada proyecto de la tabla:

1. `git -C <ruta> fetch -q origin` y leer de `origin/<rama>` (no de la copia de trabajo, que puede estar en otra rama).
2. Candidatas:
   - notas marcadas «(genérica)» en el índice;
   - notas marcadas «(en claude-base)» que hayan cambiado desde el último commit revisado (`git log <último>..origin/<rama> -- docs/conocimiento/`);
   - notas nuevas sin marca desde el último commit revisado: proponerlas solo si de verdad valen fuera (una regla de trabajo, un bug que puede pasar en cualquier código, una trampa de una herramienta o de un stack).
3. Por cada candidata, decidir el destino:
   - regla de trabajo → `CLAUDE.md`;
   - trampa o lección genérica → `skills/arrancar-proyecto/plantilla/docs/conocimiento/` (y su línea en el índice de la plantilla);
   - trampa de un stack → `skills/arrancar-proyecto/stacks/<stack>/` (y su línea en `LEEME.txt`).
   Si ya hay una nota aquí sobre lo mismo, se edita esa; no se duplica.
4. **Quitar todo lo del proyecto:** clientes, nombres de personas (salvo «Raúl»), marcas, precios, URLs, ids de cuentas y rutas de su código. Queda la lección, la fecha y «(de claude-base)». Este repo es **público**.
5. Trabajar en una rama `revision-<fecha>` de este repo, con un commit. **No fusionar ni subir:** enseñar a Raúl el diff y esperar su sí. Con el sí: fusionar en `main`, subir, cambiar las marcas a «(en claude-base)» en el proyecto (commit en una rama `claude/…`, sin subir a su rama principal salvo que sus reglas lo permitan) y actualizar la tabla de abajo.
6. Si no hay nada que subir, decirlo en una línea y actualizar solo la tabla.

## Repaso de la memoria local

La memoria de Claude en el Mac (`~/.claude/projects/<ruta del proyecto con «/» cambiadas por «-»>/memory/`) no la ven las sesiones en la nube ni otros Macs. Debe guardar solo punteros: lo que valga para otras sesiones tiene que estar en el repo del proyecto. En la revisión, por cada proyecto:

1. Leer cada fichero de su memoria (menos `MEMORY.md`) y buscar lo que **no** esté en el repo (`origin/<rama>`): reglas, decisiones, permisos, fechas o datos que solo aparecen en la memoria. Un puntero con un resumen de lo que ya está en el repo no cuenta.
2. Buscar memorias caducadas (con una fecha límite ya pasada) o que contradigan al repo.
3. **No tocar nada:** ni la memoria ni el repo del proyecto. En el resumen para Raúl, una línea por hallazgo: qué falta en el repo y dónde iría (`docs/conocimiento/…`, `decisiones.md`, `CLAUDE.md`), o qué memoria se puede borrar. Se arregla en una conversación con su sí.

Origen: el 15-nov-2026 se vio que la congelación de subidas de ODA (desde el 30-oct-2026) vivía solo en la memoria local; el repo seguía diciendo que marketing podía subirse.

## Repaso de los entornos en la nube

Todo entorno de claude.ai/code tiene que llevar en su script de configuración el contenido de [`nube/setup.sh`](nube/setup.sh) (ver «En la nube» en el README). Claude.ai no lo pone solo, así que se revisa:

1. Con Claude en Chrome (el Chrome de Raúl, con su sesión): abrir claude.ai/code en una pestaña nueva, abrir el selector de entornos (abajo, junto al repositorio) y, en «Más», ver la lista completa. Por cada entorno de la nube, pasar el ratón por encima, pulsar ⚙ y abrir «Script de configuración» **solo para leerlo**.
2. Un entorno está bien si su script contiene `rbenitezm/claude-base` y `instalar.sh`. Si está vacío o no los tiene, es un hallazgo. «Default» cuenta como uno más (ojo: puede haber más de uno con ese nombre; el predeterminado dice «no se puede renombrar ni archivar»).
3. **No cambiar nada:** cerrar cada ajuste con «Cancelar» y la pestaña al terminar. En el resumen para Raúl, una línea por entorno sin script (nombre y qué tiene ahora) y el texto de `nube/setup.sh` para pegar. Se pone en una conversación con su sí.
4. Actualizar la tabla de abajo (entornos nuevos, quitados, fecha de la revisión).
5. Si Chrome o la extensión no responden, o claude.ai pide iniciar sesión, decirlo en una línea y seguir con lo demás: no reintentar ni buscar otra vía.

| Entorno | Para qué | Script de claude-base | Revisado |
|---|---|---|---|
| Agente ODA | Rutinas de marketing de ODA | Sí (probado con una sesión) | 15-nov-2026 |
| Competencia ODA | Rutina de competencia de ODA | Sí | 15-nov-2026 |
| Default (el predeterminado) | El que usa «Automático»; no se puede renombrar ni archivar | Sí | 15-nov-2026 |
| Default (otro, con el mismo nombre) | Entorno normal llamado también «Default»; se puede archivar | Sí | 15-nov-2026 |

## Proyectos

| Proyecto | Ruta en el Mac de Raúl | Memoria local | Rama | Último commit revisado | Fecha |
|---|---|---|---|---|---|
| ODA (Relatos) | `~/Projects/Claude/Relatos` | la de su ruta (ver arriba) | `main` | `4b8a1e77` | 15-nov-2026 |

Un proyecto nuevo arrancado con `arrancar-proyecto` se añade aquí cuando tenga su primera nota propia en `docs/conocimiento/`.

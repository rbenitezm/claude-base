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

## Proyectos

| Proyecto | Ruta en el Mac de Raúl | Rama | Último commit revisado | Fecha |
|---|---|---|---|---|
| ODA (Relatos) | `~/Projects/Claude/Relatos` | `main` | `4b8a1e77` | 15-nov-2026 |

Un proyecto nuevo arrancado con `arrancar-proyecto` se añade aquí cuando tenga su primera nota propia en `docs/conocimiento/`.

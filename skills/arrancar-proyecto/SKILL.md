---
name: arrancar-proyecto
description: Monta en un proyecto nuevo (o en uno sin estructura) la forma de trabajar de Raúl que salió de ODA - CLAUDE.md con mapa de fuentes y reglas duras, registro de decisiones, lista de pendientes y docs/conocimiento con las lecciones genéricas y las trampas del stack. Úsala con "arranca el proyecto", "proyecto nuevo", "prepara la estructura", o cuando un repo no tiene CLAUDE.md.
---

# arrancar-proyecto

Deja un proyecto con la misma estructura que hace funcionar a ODA: **una fuente por tema**, decisiones y pendientes con fecha, y lo aprendido en el repo (no en la memoria de Claude), para que lo lea cualquier sesión, también las de la nube.

Todo lo que copia está en esta carpeta:
- `plantilla/CLAUDE.md` → `CLAUDE.md` en la raíz del proyecto.
- `plantilla/docs/` → `docs/` del proyecto (decisiones, pendientes y `conocimiento/` con lecciones genéricas).
- `stacks/<stack>/` → notas que se añaden a `docs/conocimiento/` solo si el proyecto usa ese stack.

## 1. Mirar lo que hay (sin tocar nada)

- `git status`, `git log --oneline | head`, `ls`, y el gestor de paquetes (`package.json`, `pyproject.toml`…): de ahí salen el stack y los comandos de verificación.
- ¿Ya hay `CLAUDE.md`, `AGENTS.md`, `docs/`? **Nunca se pisa nada.** Si existe, se propone fusionar: se enseña qué se añadiría y se espera el sí.
- ¿Algún stack de `stacks/` coincide? (Next.js + Vercel + Supabase: `next` en `package.json`, `vercel.json` o `.vercel/`, `@supabase/*`.)

## 2. Preguntar lo que no se puede deducir, en un solo bloque

Solo lo que falte tras mirar; con la propuesta deducida ya escrita para que Raúl solo corrija:

1. Qué es el proyecto en una o dos frases y para quién.
2. Quién decide (¿Raúl solo, con alguien más?).
3. Comandos para dar algo por hecho (typecheck, lint, test…).
4. Qué rama despliega y si hay permiso permanente para subir algo.
5. Datos reales que no se tocan (base de datos de producción, clientes…) y si las pruebas van contra ellos.
6. Si se publica algo fuera (redes, correo, anuncios) y quién da el visto bueno.
7. Idioma de trabajo (por defecto, español).

## 3. Copiar y rellenar

```bash
SKILL="$HOME/.claude/skills/arrancar-proyecto"
cp -n "$SKILL/plantilla/CLAUDE.md" ./CLAUDE.md
mkdir -p docs && cp -Rn "$SKILL/plantilla/docs/." ./docs/
# solo si coincide el stack:
cp -n "$SKILL/stacks/nextjs-vercel-supabase/"*.md ./docs/conocimiento/
```

(`-n` no pisa nada. Si un fichero ya existía, se fusiona a mano.)

Luego:
- Sustituir cada `{{…}}` con las respuestas. Lo que siga sin respuesta se queda como `{{por decidir: …}}` y se apunta en «Dudas abiertas» de `docs/decisiones.md`.
- Quitar del `CLAUDE.md` las reglas duras que no apliquen (p. ej. sin base de datos, sin la regla 1) y renumerar.
- Si se copiaron notas de un stack, añadir sus líneas al índice de `docs/conocimiento/README.md`: están listas para copiar en `stacks/<stack>/LEEME.txt`.
- Primera fila de `docs/decisiones.md`, con la fecha de hoy: «Estructura de trabajo creada desde claude-base (arrancar-proyecto)».

## 4. Si el proyecto va a tener agentes en la nube

Cada entorno de claude.ai/code que use el proyecto lleva en su script de configuración el contenido de `~/claude-base/nube/setup.sh` (o del repo en GitHub), copiado tal cual; así las sesiones en la nube tienen el mismo `CLAUDE.md` personal y las mismas skills que el Mac. Decírselo a Raúl con el texto para pegar, o pegarlo con su sí. Ver el apartado «En la nube» del README de claude-base.

## 5. Comprobar

```bash
grep -rn '{{' CLAUDE.md docs/ | grep -v 'por decidir'   # no debe salir nada
for f in $(grep -o '([a-z0-9-]*\.md)' docs/conocimiento/README.md | tr -d '()'); do [ -f "docs/conocimiento/$f" ] || echo "falta $f"; done
```

Enseñar a Raúl el `CLAUDE.md` resultante (corto: si pasa de ~60 líneas, sobra algo) y la lista de ficheros creados. **No hacer commit** hasta que lo pida; si el repo no tiene autor en su config local, ver el apartado Git del `~/.claude/CLAUDE.md`.

## Qué no hace esta skill

- No copia nada de un proyecto concreto (clientes, precios, marcas). Si hace falta algo de ODA, se lee en su repo y se adapta.
- No configura permisos, hooks ni MCP: eso es de cada proyecto y se decide aparte.
- No sustituye al `CLAUDE.md` personal: las reglas de trabajo generales ya llegan por `~/.claude/CLAUDE.md` y no se repiten en el del proyecto.

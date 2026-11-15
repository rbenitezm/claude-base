# claude-base

La forma de trabajar con Claude que salió de ODA (Relatos), sacada para que la use cualquier proyecto. Creado el 15-nov-2026.

## Qué hay

| Pieza | Qué es | Cuándo se carga |
|---|---|---|
| `CLAUDE.md` | Las reglas personales de Raúl: ciclo de trabajo, qué se pregunta, qué nunca, forma | **Siempre**, en todos los proyectos (enlazado como `~/.claude/CLAUDE.md`) |
| `skills/fable-method/` | El método largo: diagnosticar, descomponer por riesgo, verificar, comunicar | Cuando la tarea no es trivial (Claude la elige, o `/fable-method`) |
| `skills/arrancar-proyecto/` | Monta la estructura de un proyecto nuevo: `CLAUDE.md`, decisiones, pendientes y `docs/conocimiento/` con las lecciones genéricas | Al arrancar un proyecto (`/arrancar-proyecto`) |
| `skills/arrancar-proyecto/plantilla/` | Los ficheros que copia | — |
| `skills/arrancar-proyecto/stacks/` | Trampas por stack (hoy: Next.js + Vercel + Supabase) que se copian solo si el proyecto usa ese stack | — |

## Las capas, de general a concreto

1. **Personal** (`~/.claude/`, este repo): vale para todo.
2. **Proyecto** (`CLAUDE.md` del repo): mapa de fuentes, reglas duras y comandos de verificación de ese proyecto. Manda sobre la capa personal.
3. **Conocimiento del proyecto** (`docs/decisiones.md`, `docs/pendientes.md`, `docs/conocimiento/`): lo que se decide y se aprende, con fecha. Lo leen también los agentes en la nube, que no ven `~/.claude/`.
4. **Memoria local de Claude** (`~/.claude/projects/<carpeta>/memory/`): va por carpeta, así que no pasa de un proyecto a otro. Solo punteros.

## Instalar (o reinstalar en otro Mac)

```bash
bash ~/Projects/Claude/claude-base/instalar.sh
```

Crea los enlaces `~/.claude/CLAUDE.md` y `~/.claude/skills/<skill>` hacia este repo. Si ya hay un fichero de verdad en su sitio, lo guarda con `.antes-<fecha>` y no lo pisa.

### Si no eres Raúl

```bash
git clone https://github.com/rbenitezm/claude-base.git ~/claude-base
bash ~/claude-base/instalar.sh
```

El `CLAUDE.md` está escrito para Raúl (su nombre, su idioma, su autor de git): cámbialo por el tuyo antes de usarlo. Las skills y la plantilla valen tal cual. Necesitas [Claude Code](https://claude.com/claude-code).

## Cómo se mantiene

- Se edita aquí; los enlaces hacen que el cambio llegue a todos los proyectos al momento.
- Una lección de un proyecto que valga para todos sube aquí: al `CLAUDE.md` si es una regla de trabajo, a `plantilla/docs/conocimiento/` si es una trampa genérica, a `stacks/<stack>/` si es de un stack.
- Nada de un proyecto concreto (clientes, precios, nombres) entra aquí.
- Los agentes en la nube no ven `~/.claude/`: lo que necesiten tiene que estar en el `CLAUDE.md` y los `docs/` del repo del proyecto.

## Licencia

MIT: ver [LICENSE](LICENSE).

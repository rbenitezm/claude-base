# claude-base

La forma de trabajar con Claude que salió de ODA (Relatos), sacada para que la use cualquier proyecto. Creado el 15-nov-2026.

## Por qué

Claude Code empieza cada conversación sin recordar nada. Sin instrucciones escritas, cada sesión vuelve a suponer cómo trabajas, da cosas por hechas sin probarlas y repite errores que ya se cometieron. Lo que hace que funcione bien en un proyecto largo no es el modelo, sino lo que encuentra escrito al empezar.

**Con esto configurado, en cualquier proyecto:**

- **Trabaja igual desde la primera conversación.** Planifica antes de programar, escribe pruebas que fallan primero y no dice «hecho» sin haberlo ejecutado. Además separa lo comprobado de lo que solo debería funcionar.
- **Pregunta lo que importa, y solo eso.** Antes de borrar datos, publicar, gastar dinero o desplegar, espera tu sí. Lo menor lo decide y te lo dice en una línea, sin interrumpirte.
- **No hay que repetir tus preferencias** (idioma, fechas absolutas, autor de los commits, cómo informar) en cada proyecto ni en cada conversación.

**Arrancando un proyecto con `/arrancar-proyecto`:**

- **Una fuente por tema.** Cada cosa vive en un solo documento y los demás enlazan. Claude lee la fuente antes de responder, en vez de fiarse de lo que recuerda o de un documento viejo.
- **Las decisiones no se pierden.** Lo decidido y las dudas, con fecha, en `docs/decisiones.md`. Lo que queda por hacer, en una sola lista, `docs/pendientes.md`. Cualquier sesión sabe en qué punto está el proyecto sin que se lo cuentes.
- **Lo aprendido se queda en el repo**, no en la memoria de una conversación. Lo lee la siguiente sesión, otra persona o un agente en la nube. Cada error se paga una vez.
- **Empiezas con lecciones ya pagadas:** familias de bugs que vuelven, no borrar datos sin preguntar, pruebas contra datos reales sin riesgo, lo que funciona en local y falla en producción y, si el stack coincide, las trampas de Next.js, Vercel y Supabase.
- **Se monta en minutos y no pisa nada** de lo que ya haya en el proyecto.

Salió de casi cinco meses de trabajo diario en ODA (jun-nov 2026, unos 1.300 commits; libros y cómics personalizados: web, pipelines de IA, marketing). Cada regla está ahí porque algo salió mal sin ella.

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

### En la nube (Claude Code en claude.ai)

Las sesiones y rutinas en la nube clonan solo el repo del proyecto: no tienen `~/.claude/`. Para que trabajen con las mismas reglas que en el Mac, **todo entorno en la nube, de cualquier proyecto,** lleva en su script de configuración (claude.ai/code › elegir entorno › ⚙ › Script de configuración) el contenido de [`nube/setup.sh`](nube/setup.sh), copiado tal cual. Si no puede bajar claude-base, solo avisa: la sesión arranca igual.

- **Red:** funciona también con la red en «Limitado» y sin dominios añadidos (probado el 15-nov-2026: `git clone` pasa por el proxy del entorno aunque un `curl` a github.com dé 400). Si algún día no llega, añadir `github.com` a los dominios permitidos.
- **Caché:** la nube guarda en caché el resultado del script para arrancar más rápido, así que una sesión puede llevar una versión algo anterior de claude-base. Lo que el proyecto necesite de verdad (sus reglas duras, su conocimiento) sigue en su propio repo.
- **Comprobarlo:** una sesión en ese entorno con la orden «solo lectura: `ls ~/.claude ~/.claude/skills; head -3 ~/.claude/CLAUDE.md`».

### Si no eres Raúl

```bash
git clone https://github.com/rbenitezm/claude-base.git ~/claude-base
bash ~/claude-base/instalar.sh
```

El `CLAUDE.md` está escrito para Raúl (su nombre, su idioma, su autor de git): cámbialo por el tuyo antes de usarlo. Las skills y la plantilla valen tal cual. Necesitas [Claude Code](https://claude.com/claude-code).

## Un proyecto nuevo, paso a paso

1. **Crear la carpeta y abrirla en Claude Code** (por ejemplo en `~/Projects/Claude/<nombre>`). En un Mac con claude-base instalado no hace falta nada más: el `CLAUDE.md` personal y las skills ya se cargan en cualquier carpeta.
2. **Escribir `/arrancar-proyecto`** (o «arranca el proyecto»). Claude mira lo que hay sin tocar nada y hace en un solo bloque las preguntas que no pueda deducir: qué es, quién decide, cómo se verifica, qué despliega, qué datos no se tocan, qué se publica fuera y en qué idioma. Luego crea `CLAUDE.md`, `docs/decisiones.md`, `docs/pendientes.md` y `docs/conocimiento/` (con las trampas del stack si coincide) y enseña el resultado. Se revisa, se corrige y se le dice cuándo hacer el primer commit; si el repo no tiene autor, pide el correo.
3. **Crear el repo en GitHub:** «crea el repo en GitHub, privado».
4. **Si va a tener agentes en la nube:** crear su entorno en claude.ai/code, pegar en el script de configuración el contenido de [`nube/setup.sh`](nube/setup.sh) (Claude puede hacerlo desde Chrome), poner las claves como secretos de red del entorno (nunca en el repo) y comprobarlo con una sesión de prueba de solo lectura (ver «En la nube»).
5. **Apuntarlo en la revisión mensual:** cuando tenga su primera nota propia en `docs/conocimiento/`, añadirlo a la tabla de [`REVISIONES.md`](REVISIONES.md). Desde entonces, el primer lunes de cada mes se propone subir lo marcado «(genérica)», se avisa de lo que solo esté en la memoria local y de los entornos sin el script.

En el día a día: lo decidido, en `decisiones.md`; lo que queda, en `pendientes.md`; lo aprendido, en `docs/conocimiento/`, con «(genérica)» si vale fuera del proyecto. La memoria local de un proyecto nuevo empieza vacía, y no importa: lo que cuenta está en el repo.

## Cómo se mantiene

- Se edita aquí; los enlaces hacen que el cambio llegue a todos los proyectos al momento.
- Una lección de un proyecto que valga para todos sube aquí: al `CLAUDE.md` si es una regla de trabajo, a `plantilla/docs/conocimiento/` si es una trampa genérica, a `stacks/<stack>/` si es de un stack.
- Nada de un proyecto concreto (clientes, precios, nombres) entra aquí.
- Los agentes en la nube no ven `~/.claude/`: lo que necesiten tiene que estar en el `CLAUDE.md` y los `docs/` del repo del proyecto.

## Licencia

MIT: ver [LICENSE](LICENSE).

# Next.js: leer su documentación instalada

> Next.js cambia mucho entre versiones: antes de escribir código, leer la guía de node_modules/next/dist/docs/ y respetar los avisos de obsoleto

(de claude-base) Las versiones recientes de Next.js traen cambios que rompen lo que Claude sabe de memoria (APIs, convenciones, estructura). `next dev` escribe un bloque de reglas en `AGENTS.md` que lo recuerda; si aparece en el diff, se sube con el trabajo (quitarlo solo hace que vuelva).

**How to apply:** antes de tocar rutas, server actions, caché o configuración, leer la guía correspondiente en `node_modules/next/dist/docs/`. Un `CLAUDE.md` en la carpeta de la app puede ser solo `@AGENTS.md` para que se cargue.

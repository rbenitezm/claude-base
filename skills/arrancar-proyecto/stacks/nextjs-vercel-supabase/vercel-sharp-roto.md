# sharp no carga en Vercel

> ERR_DLOPEN libvips en las funciones desplegadas; lo crítico en JS puro, y las degradaciones son mudas

(de claude-base) Probado en producción en ODA (19-ago-2026): `import('sharp')` falla en las funciones de Vercel con `ERR_DLOPEN_FAILED: libvips-cpp` con pnpm; ni `outputFileTracingIncludes` lo arregló. En local siempre funciona, y como los usos iban dentro de `if (sharp)`, los fallos eran mudos (colores sin calcular, medidas nulas, imágenes estiradas).

**How to apply:** nada crítico depende de sharp en rutas de Vercel; medidas y colores en JS puro (`pngjs`, `jpeg-js`). Si algo de imagen «no funciona en producción», esta es la primera sospecha; comprobarlo con una cabecera o log de diagnóstico. Ver también [local-no-es-produccion](local-no-es-produccion.md).

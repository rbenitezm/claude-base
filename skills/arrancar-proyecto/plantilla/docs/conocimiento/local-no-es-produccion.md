# Funciona en local, falla en producción

> binarios y librerías nativas cambian de un entorno a otro y fallan en silencio; comprobar en el entorno real con una sonda

(de claude-base) Dos casos de ODA: `sharp` (librería nativa de imágenes) no carga en las funciones de Vercel aunque en el Mac siempre funciona (19-ago-2026), y el `ffmpeg-static` de Linux no trae el filtro `drawtext` que el del Mac sí trae (9-oct-2026). En los dos, el código estaba envuelto en un `try` y degradaba sin avisar.

**Why:** lo nativo depende del sistema donde corre; las pruebas locales no lo ven.

**How to apply:**
- Lo crítico del producto no depende de librerías nativas en entornos sin servidor; si se puede, JS puro.
- Antes de usar un binario o filtro fuera del Mac (CI, serverless, colas), comprobarlo allí (`ffmpeg -filters | grep drawtext`) o permitir la ruta del sistema por variable de entorno.
- Si algo «no funciona en producción» y en local sí, sospechar del entorno antes que del código, y comprobarlo con una sonda que deje rastro (una cabecera o un log con el motivo).

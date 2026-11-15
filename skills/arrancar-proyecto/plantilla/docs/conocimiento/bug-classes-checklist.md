# Bug classes checklist

> familias de bugs que vuelven una y otra vez (silencios, límites por defecto, carreras, orden, estado desde props, ficheros, despacho por tipo, prompts de imagen): revisar el código nuevo contra ellas

(de claude-base) Salen de las auditorías de ODA (jul-sep 2026): cada una se coló al menos dos veces antes de cazarla, casi siempre porque se arregló en un sitio y no en sus hermanos.

**Why:** arreglar una instancia no arregla la familia. El coste está en los fallos mudos: el usuario los descubre días después.

**How to apply:** al escribir o revisar código, buscar:
1. **Fallos silenciosos:** nunca ignorar el `{ error }` de la base de datos, los códigos de estado HTTP ni el `stop_reason` de un modelo (`max_tokens`, `refusal`…). Fallar en voz alta o degradar con aviso; que el error llegue a la pantalla del usuario, no solo al log. Un sondeo con tiempo límite lanza error al agotarse, no sigue como si nada.
2. **Límites por defecto:** las APIs que listan suelen cortar sin avisar (Supabase `storage.list()` devuelve 100). Pasar siempre el límite y paginar.
3. **Carreras (TOCTOU):** comprobar y actualizar en un solo paso condicional (`update … where status <> 'x'` y mirar las filas afectadas), nunca leer y luego escribir.
4. **Marcar después de actuar:** las marcas «hecho/aplicado» se guardan solo después de que la acción haya salido bien.
5. **Estado copiado de props una vez:** un componente que inicializa `useState` desde props del servidor se queda viejo tras refrescar; sincronizar con un efecto.
6. **Inputs de fichero:** copiar `Array.from(e.target.files)` ANTES de vaciar `e.target.value` y antes de cualquier `await`. Chrome vacía la lista; jsdom no, y las pruebas pasan mientras el navegador pierde el fichero.
7. **Despacho por tipo:** si el código se ramifica por tipo (género, plan, modalidad…), al añadir una rama se buscan TODAS las llamadas que se ramifican igual. Arreglar una nunca basta.

**Prompts de imagen (modelos generativos):** párrafos densos de órdenes diluyen la atención (el texto dibujado sale con letras inventadas) y las órdenes de «exagerar diferencias» sobrecorrigen. Cada regla nueva, UNA línea quirúrgica, y probar con una imagen real antes de dar por buena una tanda de reglas.
